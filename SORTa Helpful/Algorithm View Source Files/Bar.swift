//
//  Bar.swift
//  SORTa Helpful
//
//  Created by Teran on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class Bar {
    var layer  : CALayer
    var x      : CGFloat
    var y      : CGFloat
    var width  : CGFloat
    var height : CGFloat
    var value  : Int
    var offset : CGFloat
    
    
    var isBeingMoved : Bool
    var destinationPosition: CGPoint
    
    
    init(value: Int, offset: CGFloat) {
        self.layer  = CALayer()
        self.x      = 0.0
        self.y      = 0.0
        self.width  = 0.0
        self.height = 0.0
        self.value  = value
        self.layer.backgroundColor = #colorLiteral(red: 0.1042397381, green: 0.3787302775, blue: 1, alpha: 1).cgColor
        self.offset = offset
        self.isBeingMoved = false
        self.destinationPosition = CGPoint()
    }
    
    
    func setPosition(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    
    func setSize(width: CGFloat, height: CGFloat) {
        self.width   = width
        self.height  = -height
    }
    
    
    func setColor(color: UIColor) {
        self.layer.backgroundColor = color.cgColor
    }
    
    
    func setText(value: Int) {
        let textLayer      = CATextLayer()
        textLayer.string   = String(value)
        textLayer.font     = "Roboto-Bold" as CFTypeRef
        textLayer.fontSize = 8.0
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.alignmentMode   = "center"
        self.layer.addSublayer(textLayer)
    }
    
    
    func setFrame(index: Int) {
        self.x = self.offset + (CGFloat(index) * (self.width + self.offset))
        self.y = self.y - self.offset
        self.layer.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
    }
    
    
    func redraw() {
        self.layer.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
    }
    
    
    func swapCoords(bar: Bar) {
        swap(&self.x, &bar.x)
        swap(&self.x, &bar.x)
    }
}
