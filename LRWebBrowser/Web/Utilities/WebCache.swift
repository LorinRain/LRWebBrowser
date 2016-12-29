//
//  WebCache.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit
import WebKit

class WebCache: NSObject {
    
    class func cleanCacheAndCookies(completion: @escaping () -> Void) {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date.distantPast) {
            completion()
        }
    }
    
}
