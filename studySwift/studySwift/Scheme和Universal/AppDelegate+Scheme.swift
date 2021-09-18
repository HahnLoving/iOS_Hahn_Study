//
//  AppDelegate+Scheme.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

extension AppDelegate {
    
    // 热启动 冷启动 调用
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // 因为使用了观察者，冷启动的时候，需要等初始化完成
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
            let hostUrl = url.host
            let paras = url.absoluteURL.urlStringtoParams(url.absoluteString)
            print("AppDelegate scheme url = \(hostUrl)")
            print("AppDelegate scheme paras = \(paras)")
            
            var model = LinkModel()
            var para = Para()
            model.url = hostUrl
            para.name = paras["name"] as? String
            para.id = paras["id"] as? String
            para.age = paras["age"] as? String
            model.para = para
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "Scheme"), object: model)
        })
        
        return true
    }
}
