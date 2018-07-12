//
//  AlgorithmTableCell.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/11/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AlgorithmTableCell : UITableViewCell {
    @IBOutlet weak var algorithmName: UILabel!
    @IBOutlet weak var bestCase: UILabel!
    @IBOutlet weak var worstCase: UILabel!
    @IBOutlet weak var averageCase: UILabel!
    @IBOutlet weak var memory: UILabel!
    @IBOutlet weak var type: UILabel!
    
    func setAlgorithmLabels(cellData: Algorithm){
        algorithmName.text!    = cellData.name
        bestCase.text!    = cellData.bestCase
        worstCase.text! = cellData.worstCase
        averageCase.text!   = cellData.averageCase
        memory.text! = cellData.memory
        type.text! = cellData.algoType
    }
    
}
