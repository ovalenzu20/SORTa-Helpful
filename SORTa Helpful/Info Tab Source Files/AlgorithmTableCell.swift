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
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    
    func setAlgorithmLabels(cellData: Algorithm){
        algorithmName.text!    = cellData.name
        bestCase.text!    = cellData.bestCase.0
        worstCase.text! = cellData.worstCase.0
        averageCase.text!   = cellData.averageCase.0
        memory.text! = cellData.memory
        type.text! = cellData.algoType
    }
    
}
