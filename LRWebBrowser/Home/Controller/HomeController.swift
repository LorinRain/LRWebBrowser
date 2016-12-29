//
//  HomeController.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/19.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit
import WebKit

class HomeController: BaseController {

    @IBOutlet weak var tabbar: LRTabbar!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var homeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabbar.setStyle(style: .menu)
        self.setLRTabbarDelegate(tabbar: tabbar, homeController: self)
        
        self.setRequestDelegate(controller: self)
        //self.loadHomePic()
        
        self.performSegue(withIdentifier: "showWeb", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
