//
//  AlgorithmSectionView.swift
//  SORTa Helpful
//
//  Created by Teran on 7/15/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

@IBDesignable class AlgorithmSectionView: UIView {
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
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

}
