//
//  UIViewExtensions.swift
//  SORTa Helpful
//
//  Created by Teran on 7/3/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackground(primary: UIColor, secondary: UIColor) {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [primary.cgColor, secondary.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint   = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
