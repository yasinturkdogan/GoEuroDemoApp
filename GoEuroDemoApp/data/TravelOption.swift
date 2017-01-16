//
//  TravelOption.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TravelOption : NSObject, NSCoding {
    
    private static let formatter:DateFormatter = { () -> DateFormatter in
        let v = DateFormatter();
        v.dateFormat = "H:mm"
        return v;
    }();
    
    public let id:Int;
    public let providerLogo:String!
    public let priceInEuro:Float!
    public let departureTime:Date!
    public let arrivalTime:Date!
    public let numberOfStops:Int!
    
    init(json:JSON) {
        
        self.id = json["id"].intValue;
        self.providerLogo = json["provider_logo"].stringValue;
        self.priceInEuro = json["price_in_euros"].floatValue;
        self.departureTime = TravelOption.formatter.date(from: json["departure_time"].stringValue)
        self.arrivalTime = TravelOption.formatter.date(from: json["arrival_time"].stringValue);
        self.numberOfStops = json["number_of_stops"].intValue;
    }
    
    required public init(coder aDecoder: NSCoder) {
        self.id = Int(aDecoder.decodeCInt(forKey: "id"));
        self.providerLogo = aDecoder.decodeObject(forKey: "providerLogo") as! String!;
        self.priceInEuro = aDecoder.decodeFloat(forKey: "priceInEuro");
        self.departureTime = aDecoder.decodeObject(forKey: "departureTime") as! Date!
        self.arrivalTime = aDecoder.decodeObject(forKey: "arrivalTime") as! Date!
        self.numberOfStops = Int(aDecoder.decodeCInt(forKey: "numberOfStops"));
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encodeCInt(Int32(id), forKey: "id")
        aCoder.encode(providerLogo, forKey: "providerLogo");
        aCoder.encode(Float(priceInEuro), forKey: "priceInEuro");
        aCoder.encode(departureTime, forKey: "departureTime");
        aCoder.encode(arrivalTime, forKey: "arrivalTime");
        aCoder.encodeCInt(Int32(numberOfStops), forKey: "numberOfStops");
    }
    
    public var duration:TimeInterval {
        get {
            return arrivalTime.timeIntervalSince(departureTime);
        }        
    }
}

