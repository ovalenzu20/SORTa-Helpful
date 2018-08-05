//
//  SearchFilterButton.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class SearchFilterButton: UIButtonCustom {
    private var currentlySelected: Bool = false
    
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
