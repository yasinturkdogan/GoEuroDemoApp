//
//  TravelOptionManager.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON
public class TravelOptionManager {
    
    public var options:[TravelModeType:TravelMode] = [
        TravelModeType.Flight: TravelMode(url:"https://api.myjson.com/bins/w60i"),
        TravelModeType.Train: TravelMode(url:"https://api.myjson.com/bins/3zmcy"),
        TravelModeType.Bus: TravelMode(url:"https://api.myjson.com/bins/37yzm")
    ];
    
    public static let shared = TravelOptionManager()
    
    private init() {}
    
    public func getMode(type:TravelModeType)->TravelMode {
        return options[type]!;
    }
    
}
