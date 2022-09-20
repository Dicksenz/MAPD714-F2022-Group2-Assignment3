//
//  ViewController.swift
//  MAPD714F2022-group2-assignment1
//
//  Created by Dicksen Veloopillay on 2022-09-20.
//

import UIKit

class ViewController: UIViewController {

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

