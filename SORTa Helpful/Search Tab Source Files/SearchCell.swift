//
//  SearchCell.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var algoNameLabel: UILabel!
    @IBOutlet weak var bestCaseLabel: UILabel!
    @IBOutlet weak var averageCaseLabel: UILabel!
    @IBOutlet weak var worstCaseLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    
    func setSearchButtonLabels(cellData: Algorithm) {
        algoNameLabel.text!    = cellData.name
        bestCaseLabel.text!    = cellData.bestCase
        averageCaseLabel.text! = cellData.averageCase
        worstCaseLabel.text!   = cellData.worstCase
    }
}
