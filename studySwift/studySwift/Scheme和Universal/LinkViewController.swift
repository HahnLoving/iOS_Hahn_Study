//
//  LinkViewController.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

class LinkViewController: UIViewController {

    public var model:LinkModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 80))
        label.text = model?.url
        self.view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 180, width: 200, height: 80))
        label1.numberOfLines = 0
        label1.text = "id =  \(model?.para?.id ?? "") +  name =  + \(model?.para?.name ?? "") +  age =  + \(model?.para?.age ?? "")"
        self.view.addSubview(label1)
        
    }
    
    

}
