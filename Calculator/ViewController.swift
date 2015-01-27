//
//  ViewController.swift
//  Calculator
//
//  Created by 薛纪杰 on 1/26/15.
//  Copyright (c) 2015 薛纪杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var userIsInMiddleOfTypeingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInMiddleOfTypeingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInMiddleOfTypeingANumber = true
        }
    }
}

