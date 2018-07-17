//
//  SearchFilterButton.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class SearchFilterButton: UIButton {
    private var currentlySelected: Bool = false
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
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
    
    func setUnselectedProperties() {
        self.currentlySelected = false
        self.layer.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1529411765, alpha: 1)
        self.shadowColor = .black
        self.shadowOpacity = 0.50
        self.shadowRadius = 3
    }
    
    func setSelectedProperties() {
        self.currentlySelected = true
        self.layer.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1)
        self.shadowColor = .black
        self.shadowOpacity = 0.75
        self.shadowRadius = 5
    }
    
    func buttonIsSelected() -> Bool {
        return self.currentlySelected
    }
}
