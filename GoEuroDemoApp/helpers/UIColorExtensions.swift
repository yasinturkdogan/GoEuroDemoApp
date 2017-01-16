//
//  UIColorExtensions.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func fromHex(colorCode: NSInteger, alpha:CGFloat = 1) -> UIColor {
        let red: CGFloat = CGFloat((colorCode & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((colorCode & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((colorCode & 0x0000FF) >> 0) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha);
    }
}
