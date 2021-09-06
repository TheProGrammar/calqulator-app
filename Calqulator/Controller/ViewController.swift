//
//  ViewController.swift
//  Calqulator
//
//  Created by Miroslav Mali on 6.9.21..
//

import UIKit

class ViewController: UIViewController {
    
    private var pressedCalc: Bool = false
    private var numString: String = ""
    private var firstNumString: String = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                if firstNumString == "0" || firstNumString == "0."{
                    return
                } else {
                    if firstNumString.contains("0.") {
                        displayLabel.text = String(Double(displayLabel.text!)! * -1)
                    } else {
                        displayLabel.text = String(format: "%.f", Double(displayLabel.text!)! * -1)
                    }
                }
            }
            else if calcMethod == "AC" {
                firstNumString = ""
                displayLabel.text = String("0")
            }
            else if calcMethod == "%" {
                displayLabel.text = String(Double(firstNumString)! * 0.01)
                firstNumString = displayLabel.text!
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let newEntry = sender.currentTitle {
            
            if newEntry == "." || newEntry == "0" {
                displayLabel.text = "0."
                firstNumString = displayLabel.text!
            }
            else {
                displayLabel.text = firstNumString + newEntry
                firstNumString += newEntry
            }
        }
    }
}


