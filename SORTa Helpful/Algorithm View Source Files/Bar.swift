//
//  Bar.swift
//  SORTa Helpful
//
//  Created by Teran on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class Bar: AlgorithmSectionView {
    var value  : Int        = 0
    var offset : CGFloat    = 0
    var isBeingMoved : Bool = false
    var destinationPosition: CGPoint = CGPoint()
    var barLabel : UILabel = UILabel()
    
    
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
        self.barLabel.font = UIFont(name: "Roboto-Bold", size: 9.0)
        self.barLabel.text = String(value)
        self.barLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.barLabel.textAlignment = .center
        self.addSubview(barLabel)
        self.barLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.barLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.0).isActive = true
        self.barLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.barLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.barLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setFrame(index: Int, offset: CGFloat) {
        self.offset = offset
        self.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1)
        let xPos: CGFloat = self.offset + (CGFloat(index) * (self.frame.width + self.offset))
        let yPos: CGFloat = self.layer.frame.origin.y - self.offset
        self.setPosition(position: CGPoint(x: xPos, y: yPos))
        self.layer.frame = CGRect(origin: self.layer.position, size: self.layer.frame.size)
    }
    
    
    func swapPosition(bar: Bar) {
        swap(&self.layer.frame.origin.x, &bar.layer.frame.origin.x)
    }
    
    
    func selectBar(withColor color: UIColor) {
        self.setColor(color: color)
    }
    
    
    func deselectBar(withColor color: UIColor) {
        self.setColor(color: color)
    }
    
    
    static func >(left: Bar, right: Bar) -> Bool {
        return left.value > right.value
    }
    
    
    static func <(left: Bar, right: Bar) -> Bool {
        return left.value < right.value
    }
    
    
    static func ==(left: Bar, right: Bar) -> Bool {
        return left.value == right.value
    }
}
