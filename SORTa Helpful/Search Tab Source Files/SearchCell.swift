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
    
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        }
    }
    
    
    func setSearchButtonLabels(cellData: Algorithm) {
        algoNameLabel.text!    = cellData.name.uppercased()
    }
    
    func setComplexityLabel(complexity: String) {
        complexityLabel.text! = complexity
    }
}
