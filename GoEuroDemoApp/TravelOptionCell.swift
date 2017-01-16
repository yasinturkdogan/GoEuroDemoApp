//
//  TravelOptionCell.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/16/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import Foundation
import UIKit
import PINRemoteImage

public class TravelOptionCell : UITableViewCell {
    
    private static let durationFormatter:DateFormatter = { () -> DateFormatter in
        let v = DateFormatter();
        v.dateFormat = "h':'mm'h'"
        return v;
    }();
    
    private static let timeFormatter:DateFormatter = { () -> DateFormatter in
        let v = DateFormatter();
        v.dateFormat = "h':'mm"
        return v;
    }();
    
    public static let REUSE_ID  = "TravelOptionCell";
    
    @IBOutlet var logo:UIImageView!;
    @IBOutlet var timeText:UILabel!;
    @IBOutlet var priceText:UILabel!;
    @IBOutlet var durationText:UILabel!;
    
    public func populate(data:TravelOption, isEven:Bool) {
        self.priceText.text = data.priceInEuro.description + "€";
        self.durationText.text = (data.numberOfStops == 0 ? "Direct" : String(data.numberOfStops) + " stops") + " " + TravelOptionCell.durationFormatter.string(from: Date(timeIntervalSinceNow: data.duration));
        self.timeText.text = TravelOptionCell.timeFormatter.string(from: data.departureTime) + " - " + TravelOptionCell.timeFormatter.string(from:  data.arrivalTime);
        
        if let url = URL(string: data.providerLogo.replacingOccurrences(of: "{size}", with: "63")) {
            self.logo.pin_setImage(from: url);
        }
        self.contentView.backgroundColor = isEven ? UIColor.white : UIColor.fromHex(colorCode: 0xEEEEEE);
        
    }
    
}
