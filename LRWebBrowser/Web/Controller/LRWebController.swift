//
//  LRWebController.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

class LRWebController: BaseController {
    
    var url: String?
    //
    @IBOutlet weak var tabbar: LRTabbar!
    @IBOutlet weak var webView: LRWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setActions(tabbar: tabbar, webController: self)
        tabbar.setStyle(style: .web)
        if url != nil {
            webView.url = self.url
            webView.startLoad()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
