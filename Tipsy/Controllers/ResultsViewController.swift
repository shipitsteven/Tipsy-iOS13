//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Wang, Steven on 7/27/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalAmount: Float?
    var numOfPeople: Int?
    var tipPercentage: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(totalAmount!)
        settingsLabel.text = "Split between \(numOfPeople) people, with \(tipPercentage) tip."
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
}
