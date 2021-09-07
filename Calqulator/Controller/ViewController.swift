//
//  ViewController.swift
//  Calqulator
//
//  Created by Miroslav Mali on 6.9.21..
//

import UIKit

class ViewController: UIViewController {
    
    private var pressedCalc: Bool = false
    private var firstNumString: String = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //When calculation is pressed
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                // +/- sign operation - multiplies with -1
                if firstNumString == "0" || firstNumString == "0."{
                    return
                } else {
                    if firstNumString.contains("0.") {
                        displayLabel.text = String(Double(displayLabel.text!)! * -1)
                    } else {
                        displayLabel.text = String(format: "%.\(firstNumString.count + 1)g", Double(displayLabel.text!)! * -1)
                    }
                }
            }
            else if calcMethod == "AC" {
                // AC operation - resets to 0
                firstNumString = ""
                displayLabel.text = String("0")
            }
            else if calcMethod == "%" {
                // % operation - divides with 100
                if firstNumString == "" || firstNumString == "0."{
                    return
                } else {
                    displayLabel.text = String(format: "%.\(firstNumString.count + 1)g", Double(firstNumString)! * 0.01)
                    firstNumString = displayLabel.text!
                }
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let newEntry = sender.currentTitle {
            
            if (newEntry == "." || newEntry == "0") {
                // If the first number is . or 0
                
                if firstNumString.count < 2 {
                    // Checks the first number for 0 and .
                    
                    if newEntry != "0" && newEntry != "." {
                        calculateAndRefreshDisplay()
                    } else {
                        if newEntry == "." {
                            if firstNumString == "" {
                                calculateAndRefreshDisplayPointZero()
                                return
                            } else {
                                calculateAndRefreshDisplay()
                            }
                        } else if newEntry == "0" {
                            if firstNumString == "" {
                                calculateAndRefreshDisplayPointZero()
                                return
                            } else {
                                calculateAndRefreshDisplay()
                            }
                        }
                    }
                } else {
                    if newEntry == "." {
                        if firstNumString.contains(".") {
                            return
                        } else {
                            calculateAndRefreshDisplay()
                        }
                    } else {
                        calculateAndRefreshDisplay()
                    }
                }
            } else {
                // If first number is not . or 0
                if newEntry == "." {
                    if firstNumString.contains(".") {
                        return
                    } else {
                        calculateAndRefreshDisplay()
                    }
                }
                calculateAndRefreshDisplay()
            }
            
            func calculateAndRefreshDisplay() {
                // Adds new characters to display
                displayLabel.text = firstNumString + newEntry
                firstNumString += newEntry
            }
            
            func calculateAndRefreshDisplayPointZero() {
                // Adds new characters to display starting with 0.
                displayLabel.text = "0."
                firstNumString = displayLabel.text!
            }
        }
    }
}


