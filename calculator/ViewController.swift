//
//  ViewController.swift
//  calculator
//
//  Created by Chih-Ching Chang on 6/6/17.
//  Copyright © 2017 Chih-Ching Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        //print("digit = \(digit)")
        
    }
    @IBAction func `operator`(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "✖️":
                performOperation{$0 * $1}
            case "➗":
                performOperation{$1 / $0}
            case "➕":
                performOperation{$0 + $1}
            case "➖":
                performOperation{$1 - $0}
            case "√":
                performOperationSingle{sqrt($0)}
            default:break
        }
    }
    
    func performOperation (operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
        }

    }
    
    func performOperationSingle (operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
        
    }
    
    //func multiply
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("\(operandStack)")
    }
    var displayValue: Double {
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

