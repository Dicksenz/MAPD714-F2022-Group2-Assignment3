//
//  ViewController.swift
//  File name: MAPD714F2022-group2-assignment2

// Authors

// Name: Dicksen Veloopillay
// StudentID: 301255179

// Name: Mittul Bharatkumar Trivedi
// StudentID: 301296407

// Date: 2022-09-21

// App description: Assignment 2 Part 2 - Calculator App - Part 2 - Basic Calculator Functions.

// Version of Xcode: 14.0 (14A309)

import UIKit

class ViewController: UIViewController {
    
    // Bool for first launch to replace "0"
    var isFirstTimeLaunch: Bool = true

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
        
        if(!ResultLabel.text!.isEmpty){
             if(ResultLabel.text!.count == 1){
                 // Set DisplayLabel text to "0" as initial display value.
                 ResultLabel.text = "0"
                 
                 // Set isFirstTimeLaunch to true again.
                 isFirstTimeLaunch = true;
             }else{
                 // remove last value from result.
                 ResultLabel.text?.removeLast()
             }
             
         }
    }
    
    // Equal button Action
    @IBAction func EqualButton_Pressed(_ sender: UIButton) {
    }
    
    // Clear button Action
    @IBAction func ClearButton_Pressed(_ sender: UIButton) {
        // Set result label to "0"
        ResultLabel.text = "0"
        // Set isFirstTimeLaunch to true again.
        isFirstTimeLaunch = true;
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton) {
        if(isFirstTimeLaunch){
            // Replace "0" to first Number button pressed
            ResultLabel.text = String(sender.tag)
            
            // set isFirstTimeLaunch to false after first Number button is pressed
            isFirstTimeLaunch = false;
            
        }else{
            if(ResultLabel.text!.count == 1 && ResultLabel.text == "0"){
                // Replace "0" to first Number button pressed
                ResultLabel.text = String(sender.tag)
                
                
            }else{
                ResultLabel.text = ResultLabel.text! + String(sender.tag)
            }
        }
    }
    
    
    @IBAction func OperatorButton_Pressed(_ sender: UIButton) {
    }
    
}

