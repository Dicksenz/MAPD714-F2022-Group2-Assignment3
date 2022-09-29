//
//  OperandStack.swift
//  MAPD714F2022-group2-assignment2
//
//  Created by Dicksen Veloopillay on 2022-09-29.
//

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

