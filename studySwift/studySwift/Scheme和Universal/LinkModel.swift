//
//  LinkModel.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

public struct LinkModel: Codable {
    var url: String?
    var para: Para?
}

public struct Para: Codable {
    var name: String?
    var id: String?
    var age: String?
}

