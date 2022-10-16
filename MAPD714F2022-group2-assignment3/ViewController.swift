//
//  ViewController.swift
//  File name: MAPD714F2022-group2-assignment2

// Authors

// Name: Dicksen Veloopillay
// StudentID: 301255179

// Name: Mittul Bharatkumar Trivedi
// StudentID: 301296407

// Date: 2022-10-01

// App description: Assignment 2 Part 2 - Calculator App - Part 2 - Basic Calculator Functions.

// Version of Xcode: 14.0 (14A309)


// We have used Swift Data Structures: Stack for the calculator logic
// An Operand stack to store and keep track of operands
// An Operator stack to store and keep track of operators in order to check for precedence

import UIKit

// "+/-" -> tag("12")
// "%" -> tag("13")
// "/" -> tag("14")
// "x" -> tag("15")
// "-" -> tag("16")
// "+" -> tag("17")
// "SIN" -> tag("18")
// "COS" -> tag("19")
// "TAN" -> tag("20")
// "PI" -> tag("21")
// "x^2" -> tag("22")



class ViewController: UIViewController {
    
    // Bool for first launch to replace "0"
    var isFirstTimeLaunch: Bool = true
    
    // Bool for plus minus toggle
    var togglePlusMinus : Bool = false
    
    // Stack for operands
    var operands = OperandStack()
    
    // Stack for operators
    var operators = OperatorStack()
    
    // Global stack to keep track of values entered
    var globalStack = GlobalStack()
    
    // Global error variable
    var error: Bool = false

    // Result label
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var ResultLabelLandscape: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ResultLabel will fit its text size
        ResultLabel.sizeToFit()
        
        //ResultLabel landscape mode
        ResultLabelLandscape.sizeToFit()
        
        // add border width to ResultLabel
        ResultLabel.layer.borderWidth=0.5
        
        // ResultLabel landscape mode
        ResultLabelLandscape.layer.borderWidth=0.5
        
        // Mask UILabel to give rounded corners
        ResultLabel.layer.masksToBounds = true
        
        // ResultLabel landscape mode
        ResultLabelLandscape.layer.masksToBounds = true
        
        // add border radius to ResultLabel
        ResultLabel.layer.cornerRadius=15.0
        
        // ResultLabel landscape mode
        ResultLabelLandscape.layer.cornerRadius=15.0
        
        // add border color to ResultLabel
        ResultLabel.layer.borderColor=UIColor.white.cgColor
       
        // ResultLabel landscape mode
        ResultLabelLandscape.layer.borderColor=UIColor.white.cgColor
         
    }
    
    // Function to check if string value is an operator then returns true or false
    func isOperator(ch: String) -> Bool{
        return ch == "+" || ch == "-" || ch == "*" || ch == "/";
    }
    
    // Function to get operator precedence
    func getOperatorPrecedence(ch: String) -> Int {
        // Check precedence
        if (ch == "+" || ch == "-") {
            return 1;
        }
        if (ch == "*" || ch == "/") {
            return 2;
        }
            return 0;
    }
    
    
    
    // Decimal point button Action
    @IBAction func DecimalPointButton_Pressed(_ sender: UIButton) {
        if(UIDevice.current.orientation.isPortrait){
            // Check if resultLabel does not contain "."
            if(!(ResultLabel.text?.contains("."))!){
                ResultLabel.text = ResultLabel.text! + "."
            }
            
            // Check for whitepace before operand then add "."
            let index = ResultLabel.text!.index(ResultLabel.text!.startIndex, offsetBy: ResultLabel.text!.count-2)
            print(ResultLabel.text![index])
            if(ResultLabel.text![index] == " "){
                
                ResultLabel.text = ResultLabel.text! + "."
            }
            
        }
        else{
            // Check if ResultLabelLandscape does not contain "."
            if(!(ResultLabelLandscape.text?.contains("."))!){
                ResultLabelLandscape.text = ResultLabel.text! + "."
            }
            
            // Check for whitepace before operand then add "."
            let index = ResultLabelLandscape.text!.index(ResultLabelLandscape.text!.startIndex, offsetBy: ResultLabel.text!.count-2)
            print(ResultLabelLandscape.text![index])
            if(ResultLabelLandscape.text![index] == " "){
                
                ResultLabelLandscape.text = ResultLabelLandscape.text! + "."
            }
            
            
        }
 

    }
    
    // Backspace button Action
    @IBAction func BackspaceButton_Pressed(_ sender: UIButton) {
        
        if(UIDevice.current.orientation.isPortrait){
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
            
            
        }else{
            if(!ResultLabelLandscape.text!.isEmpty){
                 if(ResultLabelLandscape.text!.count == 1){
                     // Set DisplayLabel text to "0" as initial display value.
                     ResultLabelLandscape.text = "0"
                     
                     // Set isFirstTimeLaunch to true again.
                     isFirstTimeLaunch = true;
                 }else{
                     // remove last value from result.
                     ResultLabelLandscape.text?.removeLast()
                
                 }
                 
             }
            
            
        }
        
 
    }
    

    
    // Clear button Action
    @IBAction func ClearButton_Pressed(_ sender: UIButton) {
        // Set result label to "0"
        ResultLabel.text = "0"
        
        // Set result label landscape mode to "0"
        ResultLabelLandscape.text = "0"
        // Set isFirstTimeLaunch to true again.
        isFirstTimeLaunch = true;
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton) {
        if(isFirstTimeLaunch){
            // Replace "0" to first Number button pressed
            ResultLabel.text = String(sender.tag)
            ResultLabelLandscape.text = String(sender.tag)
            
            // set isFirstTimeLaunch to false after first Number button is pressed
            isFirstTimeLaunch = false;
            var input: String = ResultLabel.text!
            
            // The tokens that make up the input
            var tokens: [String] = input.split(separator: " ").map({ substr in String(substr) })
            var tokenLength: Int = (tokens.count)-1
            for n in 0...tokenLength {
                var nextToken: String = tokens[n];
                // var ch: Character = nextToken.charAt(at: 0)
                var ch: String = nextToken
         
                if (Double(ch) != nil) {
                    var value: Double = Double(ch)!
        
                    // Add to global stack to keep track of current operand
                    globalStack.push(String(value));
                    
                }
            }
            
        }else{
            if(ResultLabel.text!.count == 1 && ResultLabel.text == "0"){
                // Replace "0" to first Number button pressed
                ResultLabel.text = String(sender.tag)
                var input: String = ResultLabel.text!
                
                // The tokens that make up the input
                var tokens: [String] = input.split(separator: " ").map({ substr in String(substr) })
                var tokenLength: Int = (tokens.count)-1
                for n in 0...tokenLength {
                    var nextToken: String = tokens[n];
                    // var ch: Character = nextToken.charAt(at: 0)
                    var ch: String = nextToken
                    if (Double(ch) != nil) {
                        var value: Double = Double(ch)!
                        
                        globalStack.push(String(value));
                        
                    }
                }
                
                
            }else{
                ResultLabel.text = ResultLabel.text! + String(sender.tag)
                // Store result label value in variable Input
                var input: String = ResultLabel.text!
                
                // The tokens that make up the input
                var tokens: [String] = input.split(separator: " ").map({ substr in String(substr) })
                var tokenLength: Int = (tokens.count)-1
                for n in 0...tokenLength {
                    var nextToken: String = tokens[n];
                    // var ch: Character = nextToken.charAt(at: 0)
                    var ch: String = nextToken
                    if (Double(ch) != nil) {
                        
                        
                        var value: Double = Double(ch)!
                        
                        globalStack.push(String(value));
                        
                    }
                }
                
            }
        }
    }
    
    
    @IBAction func OperatorButton_Pressed(_ sender: UIButton) {

        // Get last value of string to check if its a number then append operator at the end
        let lastString : String = String(ResultLabel.text!.suffix(1))
        
        switch sender.tag {
         case 12: // "+/-"
             
             // Toggle plus and minus
     
            // Check if value is a number before toggle plus minus
            if(Int(ResultLabel.text!) != nil){
                let res = Int(ResultLabel.text!)! * -1
                ResultLabel.text?.removeLast()
                ResultLabel.text =  String(res)
            }

         case 13: // "%"
            
            // Get lastvalue in global stack
            let lastValue: String = globalStack.peek()
            
            // Convert value to double
            let lastValueToDouble = Double(lastValue)
            
            // Check if it is an integer
            let isInteger = floor(lastValueToDouble!) == lastValueToDouble
            
            print(lastValue)
            
            let value = Double(lastValue)! / 100
            print(value)
            
            
            // keep removing last character till whitespace is found
            for char in ResultLabel.text!.reversed(){
                if(char != " "){
                    ResultLabel.text!.removeLast()
                }else{
                    break
                }
            }
            // append new value
            ResultLabel.text = ResultLabel.text! + String(value)

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
    
    
    // Function for custom operator evaluation and push result to operand stack
    func customOperatorEvaluation(t: String) {
        // variable for left operand
        var a: Double
        
        // variable for right operand
        var b: Double
           
        if (operands.isEmpty()) {
            print("Expression error.");
            error = true;
            return;
        } else {
            b = operands.peek();
            operands.pop();
        }
        if (operands.isEmpty()) {
            print("Expression error.");
            error = true;
            return;
        } else {
            a = operands.peek();
            operands.pop();
        }
           
        // Store result
        var r: Double = 0
        
        if (t == "+") {
            r = a + b;
        } else if (t == "-") {
            r = a - b;
        } else if (t == "*") {
            r = a * b;
        } else if(t == "/") {
            r = a / b;
        } else {
            print("Operator error.");
            error = true;
        }
        operands.push(r);
    }
       
    
    
    
    // Equal button Action
    @IBAction func EqualButton_Pressed(_ sender: UIButton) {
    
        
        // Store result label value in variable Input
        let input: String = ResultLabel.text!
        
        // The tokens that make up the input
        let tokens: [String] = input.split(separator: " ").map({ substr in String(substr) })
           print(tokens)

        let tokenLength: Int = (tokens.count)-1

           for n in 0...tokenLength {
               let nextToken: String = tokens[n];
               // var ch: Character = nextToken.charAt(at: 0)
               let ch: String = nextToken
               
     

               if (Double(ch) != nil) {
                  

                   let value: Double = Double(ch)!

                   operands.push(value);
                   
               }
               else if (isOperator(ch: ch)) {
                   if (operators.isEmpty() || getOperatorPrecedence(ch: ch) > getOperatorPrecedence(ch: operators.peek())) {
                       operators.push(ch);
                   }
                   else {
                       while (!operators.isEmpty() && getOperatorPrecedence(ch: ch) <= getOperatorPrecedence(ch: operators.peek())) {
                           
                           let toProcess: String = operators.peek();
                           operators.pop();
                           customOperatorEvaluation(t: toProcess);
                       }
                       operators.push(ch);
                   }
               }
               else if (ch == "(") {
                   operators.push(ch);
               } else if (ch == ")") {
                   while (!operators.isEmpty() && isOperator(ch: operators.peek())) {
                       let toProcess: String = operators.peek();
                       operators.pop();
                       customOperatorEvaluation(t: toProcess);
                   }
                   if (!operators.isEmpty() && operators.peek() == "(") {
                       operators.pop();
                   } else {
                       print("Error: unbalanced parenthesis.");
                       error = true;
                   }
               }
           }

       

           // // Empty out the operator stack at the end of the input
           while (!operators.isEmpty() && isOperator(ch: operators.peek())) {
               let toProcess: String = operators.peek();
               operators.pop();
               customOperatorEvaluation(t: toProcess);
           }
           // Print the result if no error has been seen.
           if (error == false) {
               var result: Double = operands.peek();
               operands.pop();
               if (!operators.isEmpty() || !operands.isEmpty()) {
                   print("Expression result error.");
               } else {
                   // Show final result in result label
                   let isInteger = floor(result) == result
                  
                 
                   // Round result to 8 decimal places
                   result = round(result * 100000000) / 100000000.0
                  
                   
                   // check if result is an integer
                   if(isInteger){
                       ResultLabel.text = String(Int(result))
                   }else{
                       ResultLabel.text = String(result)
                   }
                   
           
               }
           }
    }
    
}

