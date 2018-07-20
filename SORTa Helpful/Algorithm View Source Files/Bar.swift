//
//  Bar.swift
//  SORTa Helpful
//
//  Created by Teran on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


//class Bar {
//    var layer  : CALayer
//    var x      : CGFloat
//    var y      : CGFloat
//    var width  : CGFloat
//    var height : CGFloat
//    var value  : Int
//    var offset : CGFloat
//
//
//    var isBeingMoved : Bool
//    var destinationPosition: CGPoint
//
//
//    init(value: Int, offset: CGFloat) {
//        self.layer  = CALayer()
//        self.x      = 0.0
//        self.y      = 0.0
//        self.width  = 0.0
//        self.height = 0.0
//        self.value  = value
//        self.layer.backgroundColor = #colorLiteral(red: 0.1042397381, green: 0.3787302775, blue: 1, alpha: 1).cgColor
//        self.offset = offset
//        self.isBeingMoved = false
//        self.destinationPosition = CGPoint()
//    }
//
//
//    func setPosition(x: CGFloat, y: CGFloat) {
//        self.x = x
//        self.y = y
//    }
//
//
//    func setSize(width: CGFloat, height: CGFloat) {
//        self.width   = width
//        self.height  = -height
//    }
//
//
//    func setColor(color: UIColor) {
//        self.layer.backgroundColor = color.cgColor
//    }
//
//
//    func setText(value: Int) {
//        let textLayer      = CATextLayer()
//        textLayer.string   = String(value)
//        textLayer.font     = "Roboto-Bold" as CFTypeRef
//        textLayer.fontSize = 8.0
//        textLayer.foregroundColor = UIColor.white.cgColor
//        textLayer.alignmentMode   = "center"
//        self.layer.addSublayer(textLayer)
//    }
//
//
//    func setFrame(index: Int) {
//        self.x = self.offset + (CGFloat(index) * (self.width + self.offset))
//        self.y = self.y - self.offset
//        self.layer.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
//    }
//
//
//    func redraw() {
//        self.layer.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
//    }
//
//
//    func swapCoords(bar: Bar) {
//        swap(&self.x, &bar.x)
//        swap(&self.x, &bar.x)
//    }
//}

class Bar: AlgorithmSectionView {
    var value  : Int        = 0
    var offset : CGFloat    = 0
    var isBeingMoved : Bool = false
    var destinationPosition: CGPoint = CGPoint()
    
    
    func setPosition(position: CGPoint) {
        self.layer.position = position
    }
    
    
    func setSize(width: CGFloat, height: CGFloat) {
        self.layer.frame.size = CGSize(width: width, height: -height)
    }
    
    
    func setColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    
    func setText(value: Int) {
        let barLabel = UILabel()
        barLabel.font = UIFont(name: "Roboto-Bold", size: 9.0)
        barLabel.text = String(value)
        barLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        barLabel.textAlignment = .center
        self.addSubview(barLabel)
        barLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        barLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.0).isActive = true
        barLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        barLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        barLabel.translatesAutoresizingMaskIntoConstraints = false
//        barLabel.frame = CGRect(x: 0, y: 0, width: self.layer.frame.width, height: 6)
    }
    
    
    func setFrame(index: Int, offset: CGFloat) {
        self.offset = offset
        self.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1)
        let xPos: CGFloat = self.offset + (CGFloat(index) * (self.frame.width + self.offset))
        let yPos: CGFloat = self.layer.frame.origin.y - self.offset
        self.setPosition(position: CGPoint(x: xPos, y: yPos))
        self.layer.frame = CGRect(origin: self.layer.position, size: self.layer.frame.size)
    }
    
    
    func redraw() {
//        self.layer.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
    }
    
    
    func swapPosition(bar: Bar) {
        swap(&self.layer.frame.origin.x, &bar.layer.frame.origin.x)
//        swap(&self.layer.frame.origin.y, &bar.layer.frame.origin.y)
    }
}
