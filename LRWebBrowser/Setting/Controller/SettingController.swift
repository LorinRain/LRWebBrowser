//
//  SettingController.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit
import Dispatch

class SettingController: BaseController {

    @IBOutlet weak var tableView: UITableView!
    
    //
    private var tableDelegate: SettingTableDelegate = SettingTableDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Setting"
        
        self.setTableDelegate(table: tableView, controller: self, delegate: tableDelegate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
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
