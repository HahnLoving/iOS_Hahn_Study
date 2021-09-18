//
//  rootViewController.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

class rootViewController: UIViewController {

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init(rawValue: "Scheme"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init(rawValue: "Universal"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(Scheme), name: NSNotification.Name.init(rawValue: "Scheme"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Universal), name: NSNotification.Name.init(rawValue: "Universal"), object: nil)
        
    }
    
    @objc func Scheme(notification: Notification) {
        let model: LinkModel = notification.object as! LinkModel
        let vc = LinkViewController()
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func Universal(notification: Notification) {
        let model: LinkModel = notification.object as! LinkModel
        let vc = LinkViewController()
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
