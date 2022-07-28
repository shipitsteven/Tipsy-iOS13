//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Wang, Steven on 7/27/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var inputAmount: Float
    var numOfPeople: Int
    var tipPercentage: Float
    
    mutating func calculateTip(inputAmount: Float, tipPercentage: Float) -> Float {
        return inputAmount + inputAmount * tipPercentage
    }
    
    mutating func getSplit() -> Float {
        return calculateTip(inputAmount: self.inputAmount, tipPercentage: self.tipPercentage) / Float(numOfPeople)
    }
    
}
