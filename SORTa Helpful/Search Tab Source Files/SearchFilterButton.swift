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
    
    func setUnselectedProperties() {
        self.currentlySelected = false
        self.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    func setSelectedProperties() {
        self.currentlySelected = true
        self.layer.backgroundColor = #colorLiteral(red: 0, green: 0.4352941176, blue: 1, alpha: 1)
        self.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1).cgColor
    }
    
    func buttonIsSelected() -> Bool {
        return self.currentlySelected
    }
}
