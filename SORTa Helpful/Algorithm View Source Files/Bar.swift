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
    var layer   : CALayer
    var x       : CGFloat
    var y       : CGFloat
    var element : Element
    var color   : CGColor
    
    
    init(element: Element) {
        self.layer = CALayer()
        self.x = 0.0
        self.y = 0.0
        self.element = element
        self.color = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1).cgColor
    }
    
    
    func setColor(color: UIColor) {
        self.color = color.cgColor
    }
    
    
    func setPosition() {
        
    }
    
    
    func draw() {
        
    }
    
    
    func swapCoords(bar: Bar) {
        swap(&self.x, &bar.x)
        swap(&self.x, &bar.x)
    }
}
