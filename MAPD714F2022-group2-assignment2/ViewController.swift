//
//  ViewController.swift
//  File name: MAPD714F2022-group2-assignment1

// Authors

// Name: Dicksen Veloopillay
// StudentID: 301255179

// Name: Mittul Bharatkumar Trivedi
// StudentID: 301296407

// Date: 2022-09-21

// App description: Assignment 1 - Calculator App - Part 1 - Create the app UI.

// Version of Xcode: 14.0 (14A309)

import UIKit

class ViewController: UIViewController {

    // Result label
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ResultLabel will fit its text size
        ResultLabel.sizeToFit()
        
        // add border width to ResultLabel
        ResultLabel.layer.borderWidth=0.5
        
        // Mask UILabel to give rounded corners
        ResultLabel.layer.masksToBounds = true
        
        // add border radius to ResultLabel
        ResultLabel.layer.cornerRadius=15.0
        
        // add border color to ResultLabel
        ResultLabel.layer.borderColor=UIColor.white.cgColor
       
         
    }
    

    // Decimal point button Action
    @IBAction func DecimalPointButton_Pressed(_ sender: UIButton) {
        
    }
    
    // Backspace button Action
    @IBAction func BackspaceButton_Pressed(_ sender: UIButton) {
    }
    
    // Equal button Action
    @IBAction func EqualButton_Pressed(_ sender: UIButton) {
    }
    
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton) {
    }
    
}

