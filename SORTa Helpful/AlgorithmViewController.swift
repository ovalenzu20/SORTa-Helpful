//
//  AlgorithmViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/9/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class AlgorithmViewController: UIViewController {
    
    var algorithm: Algorithm?
    
    @IBOutlet weak var testSliderLabel: UILabel!
    
    @IBAction func algoAnimationSlider(_ sender: UISlider) {
        testSliderLabel.text = String(sender.value)
    }
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var bestCaseLabel: UILabel!
    @IBOutlet weak var averageCaseLabel: UILabel!
    @IBOutlet weak var worstCaseLabel: UILabel!
    @IBOutlet weak var memoryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if algorithm != nil {
            self.title = algorithm?.name.uppercased()
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 20)!]
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            
            typeLabel.text        = algorithm?.algoType
            bestCaseLabel.text    = algorithm?.bestCase
            averageCaseLabel.text = algorithm?.averageCase
            worstCaseLabel.text   = algorithm?.worstCase
            memoryLabel.text      = algorithm?.memory
        }
    }
}
