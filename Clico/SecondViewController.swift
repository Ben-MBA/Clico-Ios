//
//  SecondViewController.swift
//  Clico
//
//  Created by Mohamed on 09/08/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import UIKit

class SecondViewController: ParentViewController {

    @IBOutlet weak var reputationValueLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    
    
    
    

    @IBAction func didSwitch(_ sender: UISwitch) {
        ProfileState.sharedState.isTrader = sender.isOn
        modeLabel.text = sender.isOn ? "Mode (Trader)" : "Mode (Client)"
        reputationValueLabel.text = sender.isOn ? "+44" : "+478"
    }
}

class ProfileState {
    var isTrader = false
    static let sharedState = ProfileState()
    fileprivate init() {}
}
