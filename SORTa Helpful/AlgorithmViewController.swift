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
    
    @IBOutlet weak var bestCaseLabel: UILabel!
    @IBOutlet weak var averageCaseLabel: UILabel!
    @IBOutlet weak var worstCaseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if algorithm != nil {
            self.title = algorithm?.name
            bestCaseLabel.text = algorithm?.bestCase
            averageCaseLabel.text = algorithm?.averageCase
            worstCaseLabel.text = algorithm?.worstCase
        }
    }
    
    
}
