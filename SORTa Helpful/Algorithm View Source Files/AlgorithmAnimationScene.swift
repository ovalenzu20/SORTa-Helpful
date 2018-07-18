//
//  AlgorithmAnimationScene.swift
//  SORTa Helpful
//
//  Created by Teran on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SpriteKit



class AlgorithmAnimationScene: SKScene {
    var animationBackground: SKSpriteNode!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0, y: 1.0)
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
    }
}
