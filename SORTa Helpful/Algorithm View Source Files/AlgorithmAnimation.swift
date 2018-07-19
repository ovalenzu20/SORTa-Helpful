//
//  AlgorithmAnimation.swift
//  SORTa Helpful
//
//  Created by Teran on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class AlgorithmAnimation {
    public var animation      : Animation
    private var animationView : UIView
    private let barWidth      : CGFloat
    public var barOffset      : CGFloat = 10
    
    
    init(animation: Animation, animationView: UIView, barWidth: CGFloat) {
        self.animation = animation
        self.animationView = animationView
        self.barWidth = barWidth
    }
    
    
    func setupAnimationView(startY: CGFloat) {
        for i in 0..<animation.elements.count{
            let barLayer = CALayer()
            barLayer.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1).cgColor
            barLayer.frame = CGRect(x: barOffset + (CGFloat(i) * (barWidth + barOffset)), y: startY - barOffset, width: barWidth, height: -1)
            let barTextLayer = CATextLayer()
            barTextLayer.string = String(animation.elements[i].value)
            barTextLayer.font = UIFont(name: "Roboto-Light", size: 8.0)
            barTextLayer.foregroundColor = UIColor.white.cgColor
            barLayer.addSublayer(barTextLayer)
            
            self.animationView.layer.addSublayer(barLayer)
        }
        
        redrawGraph(heightMap: startY)
    }
    
    
    func redrawGraph(heightMap: CGFloat) {
        CATransaction.setAnimationDuration(6.0)
        
        for i in 0..<animation.elements.count {
            let newHeight: CGFloat = CGFloat(animation.elements[i].value * -10 )
            var layerBounds = self.animationView.layer.sublayers?[i].frame
            layerBounds?.size.height = newHeight
            self.animationView.layer.sublayers?[i].frame = layerBounds!
        }
    }

}
