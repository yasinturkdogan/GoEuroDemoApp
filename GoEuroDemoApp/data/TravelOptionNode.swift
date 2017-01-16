//
//  TravelOption.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TravelNode {
    
    public let id:Int;
    public let providerLogo:String!
    public let priceInEuro:String!
    public let departureTime:String!
    public let arrivalTime:String!
    public let numberOfStops:Int!
    
    init(json:JSON) {
        self.id = json["id"].intValue;
        self.providerLogo = json["provider_logo"].stringValue;
        self.priceInEuro = json["price_in_euros"].stringValue;
        self.departureTime = json["departure_time"].stringValue;
        self.arrivalTime = json["arrival_time"].stringValue;
        self.numberOfStops = json["number_of_stops"].intValue;
    }
}
