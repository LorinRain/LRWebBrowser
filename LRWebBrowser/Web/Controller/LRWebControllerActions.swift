//
//  LRWebControllerActions.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

extension LRWebController {
    
    func setActions(tabbar: LRTabbar, webController: LRWebController) {
        let webActions = LRWebControllerActions()
        webActions.webController = webController
        tabbar.delegate = webActions
    }
    
}

class LRWebControllerActions: NSObject, LRTabbarDelegate {
    
    var webController: LRWebController?
    
    func backButtonAction(tabbar: LRTabbar) {
        webController?.webView.goBack()
    }
    
    func forwardButtonAction(tabbar: LRTabbar) {
        webController?.webView.goForward()
    }
    
    func mainButtonAction(tabbar: LRTabbar) {
        
    }
    
    func closeButtonAction(tabbar: LRTabbar) {
        webController?.dismiss(animated: true, completion: { 
            
        })
    }
    
    func refreshButtonAction(tabbar: LRTabbar) {
        webController?.webView.reload()
    }
}
