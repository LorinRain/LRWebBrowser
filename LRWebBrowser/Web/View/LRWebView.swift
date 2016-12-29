//
//  LRWebView.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/19.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit
import WebKit

class LRWebView: UIView {
    
    var url: String?
    
    // 
    private var webView: WKWebView = WKWebView()
    private var progressView: UIProgressView = UIProgressView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.buildUI()
        
        self.addObserve()
    }
    
    deinit {
        self.removeObserve()
    }
    
    private func buildUI() {
        self.addSubview(webView)
        webView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        })
        
        self.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(3)
        }
        progressView.trackTintColor = UIColor.white
        progressView.progressTintColor = UIColor.blue
        progressView.alpha = 0.0
    }
    
    func addObserve() {
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    func removeObserve() {
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" && object as! WKWebView == webView {
            progressView.alpha = 1.0
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
            if webView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.5, animations: { 
                    self.progressView.alpha = 0.0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func startLoad() {
        if url == nil {
            print("failed, haven't set url yet")
            return
        }
        if let urlStr = URL.init(string: url!) {
            webView.load(URLRequest.init(url: urlStr))
        } else {
            print("invalid url")
        }
    }
    
    public func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    public func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    public func reload() {
        webView.reload()
    }
}
