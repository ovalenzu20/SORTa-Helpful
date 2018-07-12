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
    @IBOutlet weak var complexityLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    
    func setSearchButtonLabels(cellData: Algorithm) {
        algoNameLabel.text!    = cellData.name.uppercased()
    }
    
    func setComplexityLabel(complexity: String) {
        complexityLabel.text! = complexity
    }
}
