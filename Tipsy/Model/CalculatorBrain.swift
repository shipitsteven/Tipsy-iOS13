//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Wang, Steven on 7/27/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var inputAmount: Float?
    var numOfPeople: Int?
    var tipPercentage: Float?
    var totalAmount: Float?
    
    mutating func calculateTip(inputAmount: Float, tipPercentage: Float) {
        totalAmount = inputAmount + inputAmount * tipPercentage
    }
    
    func getSplit() -> Float {
        return totalAmount! / Float(numOfPeople!)
    }
    
}
