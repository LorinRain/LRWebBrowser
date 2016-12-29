//
//  BaseController.swift
//  LRWebBrowser
//
//  Created by Lorin on 2016/12/19.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

import UIKit


/// 10进制颜色
///
/// - Parameters:
///   - r: 红
///   - g: 绿
///   - b: 蓝
/// - Returns: 颜色
func RGB10(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

/// 通过输入的16进制字符串得到颜色
///
/// - Parameter color: 16进制字符
/// - Returns: 颜色
func RGB16(color: String) -> UIColor? {
    let length = color.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
    if length != 6 {
        print("16进制颜色错误： \(color)  \(length)")
        return nil
    }
    
    let red = color.substring(to: color.index(color.startIndex, offsetBy: 2))
    let green = color.substring(with: color.index(color.startIndex, offsetBy: 2)..<color.index(color.startIndex, offsetBy: 4))
    let blue = color.substring(from: color.index(color.startIndex, offsetBy: 4))
    
    return RGB10(r: CGFloat(colorStr2Num(red)), g: CGFloat(colorStr2Num(green)), b: CGFloat(colorStr2Num(blue)))
}

private func colorStr2Num(_ color: String) -> Int {
    let str = color.uppercased()
    var sum = 0
    for i in str.utf8 {
        sum = sum * 16 + Int(i) - 48  // 0-9 从48开始
        if i >= 65 {   // A-Z 从65开始，但有初始值10，所以应该是减去55
            sum -= 7
        }
    }
    return sum
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
