//
//  HomeControllerActions.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setLRTabbarDelegate(tabbar: LRTabbar, homeController: HomeController) {
        let homeActions = HomeControllerActions()
        homeActions.homeController = homeController
        tabbar.delegate = homeActions
    }
    
    @IBAction func startBtnAction(_ sender: Any) {
        //if self.shouldPerformSegue(withIdentifier: "showWeb", sender: self) {
            self.performSegue(withIdentifier: "showWeb", sender: self)
        //}
    }
    
    @IBAction func bgTappedAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showWeb" {
            if !LRHTTPRequest.checkIsValidUrl(url: textField.text) {
                LRTipHUD.showTip(title: nil, tips: "invalid url", withTimeInterval: 1.5, dimBack: false)
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.destination is LRWebController {
            let web = segue.destination as! LRWebController
            if textField.hasText {
                let text = textField.text!
                if self.isIncludeChinese(string: text) {
                    web.url = "http://www.bing.com"
                } else {
                    if text.contains("http") {
                        web.url = text
                    } else {
                        web.url = "http://" + text
                    }
                }
            } else {
                web.url = "http://www.bing.com"
            }
            
        }
    }
    
    func isIncludeChinese(string: String) -> Bool {
        
        for (_, value) in string.characters.enumerated() {
            
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        
        return false
    }

}

class HomeControllerActions: NSObject, LRTabbarDelegate {
    
    var homeController: HomeController?
    
    func mainButtonAction(tabbar: LRTabbar) {
        homeController?.performSegue(withIdentifier: "goSetting", sender: homeController)
    }
    
    func backButtonAction(tabbar: LRTabbar) {
        
    }
    
    func forwardButtonAction(tabbar: LRTabbar) {
        
    }
}
