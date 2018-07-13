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
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var pseudocodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if algorithm != nil {
            self.title = algorithm?.name.uppercased()
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 20)!]
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            
            typeLabel.text        = algorithm?.algoType
            bestCaseLabel.text    = algorithm?.bestCase.0
            averageCaseLabel.text = algorithm?.averageCase.0
            worstCaseLabel.text   = algorithm?.worstCase.0
            memoryLabel.text      = algorithm?.memory
            infoLabel.text        = algorithm?.info
            pseudocodeLabel.text  = algorithm?.pseudocode
        }
    }
}
