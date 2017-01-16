//
//  JSONLoader.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftHTTP
import YTKeychainManager

public class JSONLoader: NSObject {
    var data: Data = Data();
    var onLoadHandler:(JSON)->Void;
    var onError:((Void)->Void)?
    
    init(onLoadHandler:@escaping (JSON)->Void, onError:SimpleClosure? = nil) {
        self.onLoadHandler = onLoadHandler;
        self.onError = onError;
        super.init();
    }
    
    func load(url:String)->Void {
        
        do {
            let opt = try HTTP.GET(url)
            opt.start { response in
                if let _ = response.error {
                    Run.onMainThread {
                        self.onError?();
                    }
                    return;
                }
                Run.onMainThread {
                    self.onLoadHandler(JSON(data: response.data));
                }
                
                
                
            }
        } catch let error {
            Run.onMainThread {
                self.onError?();
            }
            print("got an error creating the request: \(error)")
        }
    }}
