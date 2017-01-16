//
//  ViewController.swift
//  GoEuroDemoApp
//
//  Created by Rick Dangerous on 1/15/17.
//  Copyright © 2017 yasinturkdogan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {    
    
    @IBOutlet var travelOptionButtons: [UIButtonWithSelection]!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var feedbackLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    fileprivate var currentMode:TravelMode?
    fileprivate var sorting:TravelModeSorting = .Arrival

    override func viewDidLoad() {
        super.viewDidLoad();
        self.onTravelOptionSelect(travelOptionButtons.first!);
    }
    
    @IBAction func onTravelOptionSelect(_ sender: UIButtonWithSelection) {
        activityIndicator.startAnimating();
        
        let index = travelOptionButtons.index(of: sender);
        let type = TravelModeType(rawValue: index!)!;
        currentMode = TravelOptionManager.shared.getMode(type: type);
        currentMode!.delegate = self;
        currentMode!.load();
        
        self.tableView.reloadData();
        
        for button in travelOptionButtons {
            if (sender == button) {
                button.select();
            }
            else {
                button.deselect();
            }
        }
    }
    
    @IBAction func onSort(_ sender: UIButton) {
        sorting = sorting == .Arrival ? .Duration : .Arrival;
        currentMode?.sort(by:sorting);
        self.tableView.reloadData();
        
        showFeedback(sorting == .Arrival ? "Results sorted by arrival time" : "Results sorted by duration");
    }
    
    fileprivate func showFeedback(_ message:String) {
        self.feedbackLabel.text = message
        self.feedbackLabel.isHidden = false;
        self.feedbackLabel.alpha = 0;
        self.feedbackLabel.layer.removeAllAnimations();
        
        UIView.animate(withDuration: 0.5) {
            self.feedbackLabel.alpha = 1;
        }
        
        UIView.animate(withDuration: 0.5, delay: 2, options: .curveEaseIn, animations: {
            self.feedbackLabel.alpha = 0;
        }) { (success:Bool) in
            if(success) {
                self.feedbackLabel.isHidden = true;
            }
            
        }
    }
}

extension ViewController: TravelModeLoadDelegate {
    func onOptionLoad(options: Array<TravelOption>) {
        activityIndicator.stopAnimating();
        self.tableView.reloadData();
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showFeedback("Offer details are not yet implemented!");
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMode?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = currentMode!.options[indexPath.item];
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelOptionCell.REUSE_ID, for: indexPath) as! TravelOptionCell
        cell.populate(data: data, isEven:indexPath.item % 2 == 0);
        return cell;
    }
}
