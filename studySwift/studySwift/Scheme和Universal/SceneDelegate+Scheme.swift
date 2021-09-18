//
//  SceneDelegate+Scheme.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

extension SceneDelegate {
    
    // 冷启动调用
    func scheme(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        for context in connectionOptions.urlContexts{
 
            let hostUrl = context.url.host
            let paras = context.url.absoluteURL.urlStringtoParams(context.url.absoluteString)
            print("SceneDelegate scheme url = \(hostUrl)")
            print("SceneDelegate scheme paras = \(paras)")
            
            var model = LinkModel()
            var para = Para()
            model.url = hostUrl
            para.name = paras["name"] as? String
            para.id = paras["id"] as? String
            para.age = paras["age"] as? String
            model.para = para
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:
                                            {
                                                NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "Scheme"), object: model)
                                            })
                
            
        }
        
        
        
    }
    
    // 热启动调用
    func scene(_ scene:UIScene, openURLContexts URLContexts:Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        let hostUrl = url.host
        let paras = url.absoluteURL.urlStringtoParams(url.absoluteString)
        print("SceneDelegate scheme url = \(hostUrl)")
        print("SceneDelegate scheme paras = \(paras)")
        
        var model = LinkModel()
        var para = Para()
        model.url = hostUrl
        para.name = paras["name"] as? String
        para.id = paras["id"] as? String
        para.age = paras["age"] as? String
        model.para = para
        
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "Scheme"), object: model)
    }
    
}
