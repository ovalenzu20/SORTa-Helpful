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


class AlgorithmAnimationView: UIView {
    private var bars           : [Bar]   = []
    private var contentOffset  : CGFloat = 0.0
    private var barOffset      : CGFloat = 0.0
    private var barWidth       : CGFloat = 0.0
    
    
    func setupAnimationView(data: [Int]) {
        self.contentOffset = 10.0
        
        for i in 0..<data.count {
            self.bars.append(Bar(value: data[i], offset: self.contentOffset))
        }
        
        self.barOffset = CGFloat(bars.count + 1)
        self.barWidth  = (self.frame.width / CGFloat(self.bars.count)) - (self.barOffset)
        let numBars: CGFloat = CGFloat(bars.count)
        
        for i in 0..<bars.count{
            let barHeightScale = (CGFloat(bars[i].value) / numBars) * (self.frame.height - (self.contentOffset * 2))
            
            bars[i].setPosition(x: 0.0, y: self.frame.height)
            bars[i].setSize(width: self.barWidth, height: barHeightScale)
            bars[i].setFrame(index: i)
            self.layer.addSublayer(bars[i].layer)
        }
    }
    
    
//    func redrawGraph() {
//        for i in 0..<self.bars.count {
//            if self.bars[i].isBeingMoved {
//                let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//                self.bars[i].setColor(color: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
//                self.bars[i].redraw()
//                animation.fromValue = self.bars[i].layer.position
//                animation.toValue   = self.bars[i].destinationPosition
//                animation.repeatCount = 0
//                self.bars[i].layer.add(animation, forKey: #keyPath(CALayer.position))
//
//            }
//        }
//
//        for i in 0..<self.bars.count {
//            if self.bars[i].isBeingMoved {
//                self.bars[i].setColor(color: #colorLiteral(red: 0.1042397381, green: 0.3787302775, blue: 1, alpha: 1))
//                self.bars[i].isBeingMoved = false
//            }
//        }
//    }
    
    
    func BubbleSort() {
        var sortedAboveIndex = self.bars.count
        
        repeat {
            var lastSwapIndex = 0
            
            for i in stride(from: 1, to: sortedAboveIndex, by: 1) {
                if (bars[i - 1].value > bars[i].value) {
                    self.bars.swapAt(i, i - 1)
//                    self.bars[i].isBeingMoved            = true
//                    self.bars[i].destinationPosition     = self.bars[i - 1].layer.position
//                    self.bars[i - 1].isBeingMoved        = true
//                    self.bars[i - 1].destinationPosition = self.bars[i].layer.position
//                    self.bars[i].swapCoords(bar: self.bars[i - 1])
                    lastSwapIndex = i
                }
            }
            
            sortedAboveIndex = lastSwapIndex
            
        } while (sortedAboveIndex != 0)
    }
    
    
    func InsertionSort() {
        for i in 1..<bars.count {
            var j = i
            
            while j > 0 && bars[j].value < bars[j - 1].value {
                self.bars.swapAt(j - 1, j)
                j -= 1
            }
        }
    }
    
    
    func QuickSort() {
        
    }
    
    
    func SelectionSort() {
        
    }
    
    
    func HeapSort() {
        
    }
    
    
    func CocktailSort() {
        
    }
    
    
    func MergeSort() {
        
    }
    
    
    func BlockSort() {
        
    }
    
    
    func BucketSort() {
        
    }
    
    
    func CubeSort() {
        
    }
    
    
    func RaidxSort() {
        
    }
    
    
    func SpreadSort() {
        
    }
    
    
    func PigeonholeSort() {
        
    }
}
