//
//  SearchTextField.swift
//  SORTa Helpful
//
//  Created by Teran on 7/14/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for view in subviews {
            if let button = view as? UIButton {
                button.setImage(button.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.tintColor = .white
            }
        }
    }
}
