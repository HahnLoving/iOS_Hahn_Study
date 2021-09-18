//
//  URL+EX.swift
//  studySwift
//
//  Created by Hahn on 2021/9/16.
//

import UIKit

extension URL {
    /// url字符串转字典
    ///
    /// - Parameter urlString: urlString字符串
    /// - Returns: [String: Any]
    public func urlStringtoParams(_ urlString:String) -> [String: Any] {
        // 1 保存参数
        var url_array = [""]
        // 2 内容中是否存在?或者//
        if urlString.contains("?") {
            url_array = urlString.components(separatedBy:"?")
        }else{
            url_array = urlString.components(separatedBy: "//")
        }
        // 3 多个参数，分割参数
        let urlComponents = url_array[1].components(separatedBy: "&")
        // 4 保存返回值
        var params = [String: Any]()
        // 5 遍历参数
        for keyValuePair in urlComponents {
            // 5.1 分割参数 生成Key/Value
            let pairComponents = keyValuePair.components(separatedBy:"=")
            // 5.2 获取数组首元素作为key
            let key = pairComponents.first?.removingPercentEncoding
            // 5.3 获取数组末元素作为value
            let value = pairComponents.last?.removingPercentEncoding
            // 5.4 判断参数是否是数组
            if let key = key, let value = value {
                // 5.5 已存在的值，生成数组
                if let existValue = params[key] {
                    // 5.8 如果是已经生成的数组
                    if var existValue = existValue as? [Any] {
                        // 5.9 把新的值添加到已经生成的数组中去
                        existValue.append(value)
                        params[key] = existValue
                    } else {
                        // 5.7 已存在的值，先将他生成数组
                        params[key] = [existValue, value]
                    }
                } else {
                    // 5.6 参数是非数组
                    params[key] = value
                }
            }
        }
        return params
    }
}
