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

    var userIsInMiddleOfTypeingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInMiddleOfTypeingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInMiddleOfTypeingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleOfTypeingANumber {
            enter()
        }
        
        switch operation {
//        case "×": performOpeartion({ (op1: Double, op2: Double) -> Double in
//            return op1 * op2
//        })
//        case "÷": performOpeartion({ (op1, op2) in return op1 / op2 })
//        case "+": performOpeartion({ (op1, op2) in op1 + op2 })
//        case "−": performOpeartion({ $0 - $1 })
            
        case "×": performOpeartion() {$0 * $1}
        case "÷": performOpeartion {$1 / $0}
        case "+": performOpeartion {$0 + $1}
        case "−": performOpeartion {$1 - $0}
        case "√": performOpeartion {sqrt($0)}
        default: break
        }
    }
    
    func performOpeartion(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }

    func performOpeartion(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInMiddleOfTypeingANumber = false
        operandStack.append(displayValue)
        println("\(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            display.text = "\(newValue)"
            userIsInMiddleOfTypeingANumber = false
        }
    }
}

