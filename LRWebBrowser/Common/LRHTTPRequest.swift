//
//  LRHTTPRequest.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/21.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

class LRHTTPRequest: NSObject {
    
    class func get(url: String, param: Any?, success: @escaping ((Dictionary<String, Any>?) -> Void), failure: @escaping ((String?) -> Void)) {
        let request = NSMutableURLRequest.init(url: URL.init(string: url)!)
        request.timeoutInterval = 30
        request.httpMethod = "GET"
        if param != nil {
            let data = try! JSONSerialization.data(withJSONObject: param!, options: .prettyPrinted)
            var string = "json="
            let Str = String.init(data: data, encoding: String.Encoding.init(rawValue: String.Encoding.utf8.rawValue))
            string = string + Str!
            request.httpBody = string.data(using: String.Encoding.utf8)
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                failure("request failed (2640)")
            } else {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                success(json as? Dictionary<String, Any?>)
            }
        }
        
        dataTask.resume()
        
    }
    
    class func loadImage(url: String, success: @escaping ((UIImage?) -> Void), failure: @escaping ((String?) -> Void)) {
        let request = NSMutableURLRequest.init(url: URL.init(string: url)!)
        request.timeoutInterval = 30
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error != nil {
                failure("request failed (2645)")
            } else {
                let image = UIImage.init(data: data!)
                success(image)
            }
        }
        
        dataTask.resume()
    }
    
    class func checkIsValidUrl(url: String?) -> Bool {
        if url != nil {
            if URL.init(string: url!) != nil || url!.isEmpty {
                return true
            } else {
                return false
            }
        } else {
           return false
        }
    }

}
