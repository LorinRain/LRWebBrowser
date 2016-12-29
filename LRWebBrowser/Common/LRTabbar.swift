//
//  LRTabbar.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/19.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit

@objc protocol LRTabbarDelegate {
    @objc optional func backButtonAction(tabbar: LRTabbar)
    @objc optional func forwardButtonAction(tabbar: LRTabbar)
    @objc optional func mainButtonAction(tabbar: LRTabbar)
    @objc optional func closeButtonAction(tabbar: LRTabbar)
    @objc optional func refreshButtonAction(tabbar: LRTabbar)
}

enum LRTabbarStyle {
    case web     // for web mode
    case menu    // for normal mode
}

class LRTabbar: UIView {
    
    var delegate: LRTabbarDelegate?
    
    //
    private var backBtn: UIButton!
    private var forwardBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setDefault()
    }
    
    private func setDefault() {
        self.backgroundColor = RGB16(color: "f5f5f5")
    }
    
    private func buildupWebSubviews() {
        let centerBtn = UIButton(type: .custom)
        self.addSubview(centerBtn)
        centerBtn.setTitle("の", for: .normal)
        centerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.centerX.equalTo(self)
            make.width.equalTo(60)
        }
        centerBtn.backgroundColor = UIColor.cyan
        centerBtn.addTarget(self, action: #selector(centerBtnAction(button:)), for: .touchUpInside)
        
        backBtn = UIButton(type: .custom)
        self.addSubview(backBtn)
        backBtn.setTitle("＜", for: .normal)
        backBtn.setTitleColor(RGB16(color: "333333"), for: .normal)
        backBtn.setTitleColor(UIColor.lightGray, for: .disabled)
        backBtn.addTarget(self, action: #selector(backButtonAction(button:)), for: .touchUpInside)
        
        forwardBtn = UIButton(type: .custom)
        self.addSubview(forwardBtn)
        forwardBtn.setTitle("＞", for: .normal)
        forwardBtn.setTitleColor(RGB16(color: "333333"), for: .normal)
        forwardBtn.setTitleColor(UIColor.lightGray, for: .disabled)
        forwardBtn.addTarget(self, action: #selector(forwardButtonAction(button:)), for: .touchUpInside)
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        forwardBtn.snp.makeConstraints { (make) in
            make.left.equalTo(backBtn.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(backBtn.snp.width)
            make.right.equalTo(centerBtn.snp.left)
        }
        
        let closeBtn = UIButton(type: .custom)
        self.addSubview(closeBtn)
        closeBtn.setTitle("×", for: .normal)
        closeBtn.setTitleColor(RGB16(color: "333333"), for: .normal)
        closeBtn.addTarget(self, action: #selector(closeButtonAction(button:)), for: .touchUpInside)
        
        let refreshBtn = UIButton(type: .custom)
        self.addSubview(refreshBtn)
        refreshBtn.setTitle("Ω", for: .normal)
        refreshBtn.setTitleColor(RGB16(color: "333333"), for: .normal)
        refreshBtn.addTarget(self, action: #selector(refreshButtonAction(button:)), for: .touchUpInside)
        
        closeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        refreshBtn.snp.makeConstraints { (make) in
            make.right.equalTo(closeBtn.snp.left)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(centerBtn.snp.right)
            make.width.equalTo(closeBtn.snp.width)
        }
    }
    
    private func buildupMenuSubviews() {
        let centerBtn = UIButton(type: .custom)
        self.addSubview(centerBtn)
        centerBtn.setTitle("の", for: .normal)
        centerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.centerX.equalTo(self)
            make.width.equalTo(60)
        }
        centerBtn.backgroundColor = UIColor.cyan
        centerBtn.addTarget(self, action: #selector(centerBtnAction(button:)), for: .touchUpInside)
    }
    
    func centerBtnAction(button: UIButton) {
        delegate?.mainButtonAction!(tabbar: self)
    }
    
    func backButtonAction(button: UIButton) {
        delegate?.backButtonAction!(tabbar: self)
    }
    
    func forwardButtonAction(button: UIButton) {
        delegate?.forwardButtonAction!(tabbar: self)
    }
    
    func closeButtonAction(button: UIButton) {
        delegate?.closeButtonAction!(tabbar: self)
    }
    
    func refreshButtonAction(button: UIButton) {
        delegate?.refreshButtonAction!(tabbar: self)
    }
    
    public func setBackBtnEnable(isEnable: Bool) {
        backBtn.isEnabled = isEnable
    }
    
    public func setForwardBtnEnable(isEnable: Bool) {
        forwardBtn.isEnabled = isEnable
    }
    
    public func setStyle(style: LRTabbarStyle) {
        if style == .web {
            self.buildupWebSubviews()
        }
        if style == .menu {
            self.buildupMenuSubviews()
        }
    }

}
