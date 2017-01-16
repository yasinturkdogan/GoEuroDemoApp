//
//  Run.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON

open class Run {
    
    @discardableResult
    open class func afterDelay(_ delayInSeconds: Double, block: @escaping ()->()) -> SimpleClosure? {
        
        var cancelled = false
        let cancelClosure: SimpleClosure = {
            cancelled = true
        }
        
        let time = DispatchTime.now() + Double(Int64(delayInSeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            () -> Void in
            if !cancelled {
                block()
            }
        }
        return cancelClosure;
    }
    
    open class func onMainThread(_ block: @escaping ()->()) {
        
        DispatchQueue.main.async {
            block();
        }
        
    }
}
