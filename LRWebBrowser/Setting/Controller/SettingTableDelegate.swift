//
//  SettingTableDelegate.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/20.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

extension SettingController {
    
    func setTableDelegate(table: UITableView, controller: SettingController, delegate: SettingTableDelegate) {
        delegate.settingController = controller
        table.delegate = delegate
        table.dataSource = delegate
    }
    
}

class SettingTableDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var settingController: SettingController?
    
    //
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.text = "clear cache"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        if indexPath.section == 0 {  // clear cache
            cell?.accessoryView = self.activityIndicator
            self.activityIndicator.startAnimating()
            WebCache.cleanCacheAndCookies(completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { 
                    self.activityIndicator.stopAnimating()
                    LRTipHUD.showTip(title: nil, tips: "clear success", withTimeInterval: 1, dimBack: false)
                })
            })
        }
    }
    
}
