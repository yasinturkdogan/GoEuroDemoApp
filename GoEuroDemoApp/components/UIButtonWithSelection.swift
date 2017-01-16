//
//  UIButtonWithSelection.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import UIKit

public class UIButtonWithSelection : UIButton {
    
    let bottomLine:UIView = UIView();
    public override func awakeFromNib() {
        bottomLine.frame = CGRect(x: self.frame.width / 2, y: self.frame.height - 4, width: 0, height: 4);
        bottomLine.backgroundColor = UIColor.orange;
        self.addSubview(bottomLine);
    }
    
    public func deselect() {
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.frame = CGRect(x: self.frame.width / 2, y: self.frame.height - 4, width: 0, height: 4);
        }
    }
    
    public func select() {
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.frame = CGRect(x: 0, y: self.frame.height - 4, width: self.frame.width, height: 4);
        }
    }
}
