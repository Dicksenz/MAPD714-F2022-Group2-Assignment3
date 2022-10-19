//
//  OperandStack.swift
//  File name: MAPD714F2022-group3-assignment3

// Authors

// Name: Dicksen Veloopillay
// StudentID: 301255179

// Name: Mittul Bharatkumar Trivedi
// StudentID: 301296407

// Date: 2022-10-19

// App description: Assignment 3 Part 3 - Additional Functions

// Version of Xcode: 14.0 (14A309)
import Foundation

// This is my operand stack
struct OperandStack {
    
    private var items: [Double] = []
    
    func peek() -> Double {
        // guard let to ensure that the items array has a value stored to begin with.
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    // Removes the first item in the array
    mutating func pop() -> Double {
        return items.removeFirst()
    }
    
    mutating func push(_ element: Double) {
        items.insert(element, at: 0)
    }
    
    // Check if stack is empty
    func isEmpty() -> Bool{
        if(items.isEmpty){
            return true
            
        }
        return false
        
        
    }
    
}

