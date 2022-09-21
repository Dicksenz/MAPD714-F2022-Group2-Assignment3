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

    @IBOutlet weak var BackspaceBtn: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.sizeToFit()
        ResultLabel.layer.borderWidth=0.5
        ResultLabel.layer.masksToBounds = true
        ResultLabel.layer.cornerRadius=15.0
        ResultLabel.layer.borderColor=UIColor.white.cgColor
       
         
    }


}

