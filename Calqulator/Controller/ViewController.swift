//
//  ViewController.swift
//  Calqulator
//
//  Created by Miroslav Mali on 6.9.21..
//

import UIKit

class ViewController: UIViewController {
    
    private var pressedCalc: Bool = false
    private var mainNumString: String = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //When calculation is pressed
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                // +/- sign operation - multiplies with -1
                if mainNumString == "0" || mainNumString == "0."{
                    return
                } else {
                    if mainNumString.contains("0.") {
                        displayLabel.text = String(Double(displayLabel.text!)! * -1)
                    } else {
                        displayLabel.text = String(format: "%.\(mainNumString.count + 1)g", Double(displayLabel.text!)! * -1)
                    }
                }
            }
            else if calcMethod == "AC" {
                // AC operation - resets to 0
                mainNumString = ""
                displayLabel.text = String("0")
            }
            else if calcMethod == "%" {
                // % operation - divides with 100
                if mainNumString == "" || mainNumString == "0."{
                    return
                } else {
                    displayLabel.text = String(format: "%.\(mainNumString.count + 1)g", Double(mainNumString)! * 0.01)
                    mainNumString = displayLabel.text!
                }
            }
        }
    }
    
    private var didEnterFirstNum: Bool = false
    
    func updateDisplay(newEntry sender: UIButton) {
        mainNumString += sender.currentTitle!
        displayLabel.text! = mainNumString
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //Run when a number is pressed on the keypad
        
        if var newEntry = sender.currentTitle {
            
            if !didEnterFirstNum {
                if newEntry == "0" || newEntry == "." {
                    newEntry = "0."
                    updateDisplay(newEntry: sender)
                    didEnterFirstNum = true
                } else {
                    updateDisplay(newEntry: sender)
                    didEnterFirstNum = true
                }
            } else {
                if newEntry == "." && mainNumString.contains(".") {
                    return
                } else {
                    updateDisplay(newEntry: sender)
                }
            }
        }
        
        
    }
}


