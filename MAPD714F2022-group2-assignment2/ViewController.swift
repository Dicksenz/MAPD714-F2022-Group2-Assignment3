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

// "+/-" -> tag("12")
// "%" -> tag("13")
// "/" -> tag("14")
// "x" -> tag("15")
// "-" -> tag("16")
// "+" -> tag("17")

class ViewController: UIViewController {
    
    // Bool for first launch to replace "0"
    var isFirstTimeLaunch: Bool = true
    
    // Bool for plus minus toggle
    var togglePlusMinus : Bool = false
    
    // Stack for operands
    var operands = OperandStack()
    
    // Stack for operators
    var operators = OperatorStack()

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
    
    // Function to check if string value is an operator then returns true or false
    func isOperator(ch: String) -> Bool{
        return ch == "+" || ch == "-" || ch == "*" || ch == "/";
    }
    
    // Decimal point button Action
    @IBAction func DecimalPointButton_Pressed(_ sender: UIButton) {
        
        
        
        if(!(ResultLabel.text?.contains("."))!){
            ResultLabel.text = ResultLabel.text! + "."
        }
        let index = ResultLabel.text!.index(ResultLabel.text!.startIndex, offsetBy: ResultLabel.text!.count-2)
        print(ResultLabel.text![index])
        if(ResultLabel.text![index] == " "){
            
            ResultLabel.text = ResultLabel.text! + "."
        }
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

        // Get last value of string to check if its a number then append operator at the end
        let lastString : String = String(ResultLabel.text!.suffix(1))
        
        switch sender.tag {
         case 12: // "+/-"
             
             // Toggle plus and minus
     
            if(Int(ResultLabel.text!) != nil){
                let res = Int(ResultLabel.text!)! * -1
                ResultLabel.text?.removeLast()
                ResultLabel.text =  String(res)
            }

         case 13: // "%"
             if(Int(lastString) != nil){
                 
                 ResultLabel.text = ResultLabel.text! + " " + "%" + " "
     
             }

         case 14: // "/"
             if(Int(lastString) != nil){
                 ResultLabel.text = ResultLabel.text! + " " + "/" + " "
                 
             }
             
         case 15: // "x"
             if(Int(lastString) != nil){
                 ResultLabel.text = ResultLabel.text! + " " + "*" + " "
                 
             }
             
         case 16: // "-"
             isFirstTimeLaunch = false;
             if(Int(lastString) != nil){
                 ResultLabel.text = ResultLabel.text! + " " + "-" + " "
             }
         
         case 17: // "+"
             
             if(Int(lastString) != nil){
                 ResultLabel.text = ResultLabel.text! + " " + "+" + " "
                 
             }

         default:
             print("Invalid operand")
         }
    }
    
}

