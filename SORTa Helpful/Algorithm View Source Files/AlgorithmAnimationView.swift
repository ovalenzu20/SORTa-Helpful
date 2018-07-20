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
    private var animator       : UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut)
    
    
    func setupAnimationView(data: [Int]) {
        self.contentOffset = 10.0
        
        for i in 0..<data.count {
            let bar = Bar()
            bar.value = data[i]
            self.bars.append(bar)
        }
        
        self.barOffset = CGFloat(bars.count + 1)
        self.barWidth  = (self.frame.width / CGFloat(self.bars.count)) - (self.barOffset)
        let numBars: CGFloat = CGFloat(bars.count)
        
        for i in 0..<bars.count{
            let barHeightScale = (CGFloat(bars[i].value) / numBars) * (self.frame.height - (self.contentOffset * 2))
            
            self.addSubview(bars[i])
            bars[i].setText(value: bars[i].value)
            bars[i].setPosition(position: CGPoint(x: 00.0, y: self.frame.height))
            bars[i].setSize(width: self.barWidth, height: barHeightScale)
            bars[i].setFrame(index: i, offset: self.contentOffset)
        }
    }
    
    
    func testAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            self.BubbleSort()
        })
    }
    
    
    func swapWithAnimation(i: Int, j: Int) {
        UIView.animate(withDuration: 1.0, delay: Double(i), options: .curveEaseOut, animations: {
//            var bar1: bars[i]
//            var bar2: bars[j]
//            bar1.swapPosition(bar2)
            self.bars[i].swapPosition(bar: self.bars[j])
        })
    }
    
    
    func BubbleSort() {
//        self.animator = {
//
//            let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut)
//
//            animator.addAnimations {
//
//                UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeLinear], animations: {
//
//                    // Step 1: make the capsule grow to large size
//                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1) {
//                        capsule.bounds = capsuleFrameWide
//                    }
//
//                    // enumerate over dots so they are slightly staggered
//                    for i in 0..<self.bars.count {
//                        let offsetDelay = TimeInterval(index) * 0.025
//
//                        // Step 2: move the dots to their default positions, and fade in
//                        UIView.addKeyframe(withRelativeStartTime: 0.05 + offsetDelay, relativeDuration: 0.2) {
//                            dot.transform = .identity
//                            dot.alpha = 1.0
//                        }
//
//                        // Step 3: fade out dots and translate to the right
//                        UIView.addKeyframe(withRelativeStartTime: 0.8 + offsetDelay, relativeDuration: 0.2) {
//
//                            //dot.alpha = 0.0
//                            dot.transform = offstageRight
//                        }
//                    }
//
//                    // Step 4: make capsure move to narrow width
//                    UIView.addKeyframe(withRelativeStartTime: 0.875, relativeDuration: 0.1) {
//                        capsule.bounds = capsuleFrameNarrow
//                    }
//                })
//            }
//
//            return animator
//        }
        
        var sortedAboveIndex = self.bars.count
        
        repeat {
            var lastSwapIndex = 0
            
            for i in stride(from: 1, to: sortedAboveIndex, by: 1) {
                if (bars[i - 1].value > bars[i].value) {
                    self.bars.swapAt(i, i - 1)
                    self.swapWithAnimation(i: i, j: i - 1)
//                    self.bars[i].isBeingMoved            = true
//                    self.bars[i].destinationPosition     = self.bars[i - 1].layer.position
//                    self.bars[i - 1].isBeingMoved        = true
//                    self.bars[i - 1].destinationPosition = self.bars[i].layer.position
//                    self.bars[i].swapPosition(bar: self.bars[i - 1])
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
