//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent: Float?
    var split: Int?
    
    var calculatorBrain = CalculatorBrain(inputAmount: 0.0, numOfPeople: 2, tipPercentage: 0.1)
    
    override func viewDidLoad() {
        split = 2
        selectButton(button: tenPctButton)
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        selectButton(button: sender)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let input: String = billTextField.text ?? "0.0"
        let inputAmount: Float = Float(input) ?? 0.0
        calculatorBrain.calculateTip(inputAmount: inputAmount, tipPercentage: tipPercent!)
        calculatorBrain.getSplit()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func selectButton(button: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if (button == zeroPctButton) {
            zeroPctButton.isSelected = true
            tipPercent = 0.0
        } else if (button == tenPctButton) {
            tenPctButton.isSelected = true
            tipPercent = 0.1
        } else if (button == twentyPctButton) {
            twentyPctButton.isSelected = true
            tipPercent = 0.2
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numOfPeople = split ?? 0
            destinationVC.totalAmount = calculatorBrain.getSplit()
            destinationVC.tipPercentage = tipPercent ?? 0.0
        }
    }
    
}

