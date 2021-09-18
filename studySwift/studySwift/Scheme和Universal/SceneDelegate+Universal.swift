//
//  SceneDelegate+Universal.swift
//  studySwift
//
//  Created by Hahn on 2021/9/17.
//

import UIKit

extension SceneDelegate {
    // 热启动 冷启动 调用
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:{
            if let url = userActivity.webpageURL {
                let hostUrl = url.host
                let paras = url.absoluteURL.urlStringtoParams(url.absoluteString)
                print("SceneDelegate universal url = \(hostUrl)")
                print("SceneDelegate universal paras = \(paras)")
                
                var model = LinkModel()
                var para = Para()
                model.url = hostUrl
                para.name = paras["name"] as? String
                para.id = paras["id"] as? String
                para.age = paras["age"] as? String
                model.para = para
                
                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "Universal"), object: model)
            }
        })
        
    }
}
