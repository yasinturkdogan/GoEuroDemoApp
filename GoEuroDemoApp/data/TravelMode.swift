//
//  TravelMode.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON
import YTKeychainManager

public enum TravelModeType:Int {
    case Flight = 0;
    case Bus = 1;
    case Train = 2;
}

public enum TravelModeSorting {
    case Arrival;
    case Duration;
}

public class TravelMode:NSObject, NSCoding {
    
    public var options:Array<TravelOption> = [];
    public var delegate:TravelModeLoadDelegate?
    
    fileprivate let url:String!
   
    init(url:String) {
        self.url = url;
    }
    
    required public init(coder aDecoder: NSCoder) {
        self.url = aDecoder.decodeObject(forKey: "url") as! String!;
        self.options = aDecoder.decodeObject(forKey: "options") as! Array<TravelOption>!;
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(url, forKey: "url");
        aCoder.encode(options, forKey: "options");
    }
    
    
    
    public func load() {
        
        if(!options.isEmpty) {
            self.delegate?.onOptionLoad(options:self.options);
            return;
        }
        
        if let cachedMode = YTSimpleCache.shared.unarchive(fileName: self.url.md5 + ".cache") as? TravelMode{
            print("Cache Hit!")
            self.options = cachedMode.options;
            self.delegate?.onOptionLoad(options:self.options);
        }
        
        
        let jsonLoader = JSONLoader(onLoadHandler: { (json:JSON) in
            self.options.removeAll();
            for eachItem in json.arrayValue {
                self.options.append(TravelOption(json: eachItem));
            }
            
            YTSimpleCache.shared.archive(fileName: self.url.md5 + ".cache", objectToSave: self);
            self.delegate?.onOptionLoad(options:self.options);
        });
        
        jsonLoader.load(url: url);
    }
    
    public func sort(by:TravelModeSorting) {
        if(by == .Arrival) {
            options.sort { (option1:TravelOption, option2:TravelOption) -> Bool in
                return option1.arrivalTime.timeIntervalSince(option2.arrivalTime) < 0
            }
            return;
        }
        
        if(by == .Duration) {
            options.sort { (option1:TravelOption, option2:TravelOption) -> Bool in
                return option1.duration < option2.duration;
            }
            return;
        }
        
        
    }
    
    
}


public protocol TravelModeLoadDelegate {
    func onOptionLoad(options:Array<TravelOption>);
}
