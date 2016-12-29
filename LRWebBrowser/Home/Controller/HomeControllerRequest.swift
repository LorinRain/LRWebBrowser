//
//  HomeControllerRequest.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/21.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setRequestDelegate(controller: HomeController) {
        HomeControllerRequest.sharedRequest.homeController = controller
    }
    
    func loadHomePic() {
        if HomeControllerRequest.sharedRequest.homeController == nil {
            print("haven't set request delegate yet")
            return
        }
        
        HomeControllerRequest.sharedRequest.loadHomePic()
    }
}

private let sharedRe = HomeControllerRequest()

class HomeControllerRequest: NSObject {
    
    var homeController: HomeController?
    
    class var sharedRequest: HomeControllerRequest {
        return sharedRe;
    }
    
    func loadHomePic() {
        LRHTTPRequest.get(url: "http://lab.dobyi.com/api/bing.php", param: nil, success: { (response) in
            let picUrl = response?["url"]
            if picUrl != nil {
                LRHTTPRequest.loadImage(url: picUrl as! String, success: { (image) in
                    DispatchQueue.main.async {
                        self.homeController?.homeImageView.image = image
                    }
                }, failure: { (fail) in
                    print("image failed")
                })
            }
        }) { (falied) in
            
        }
    }

}
