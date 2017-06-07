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
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        print("digit = \(digit)")
        
    }

}

