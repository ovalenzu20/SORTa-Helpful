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
    public  var animator       : UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 8.0, curve: .easeInOut)
    
    
    func setupAnimationView(data: [Int], algorithm: String) {
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
        
        self.animator = UIViewPropertyAnimator(duration: 8.0, curve: .linear)
        self.animator.pausesOnCompletion = true
        self.setAnimationFor(algorithm: algorithm)
    }
    
    
    func redraw() {
        self.setNeedsDisplay()
    }
    
    
    func setAnimationFor(algorithm: String) {
        switch algorithm {
        case "Bubble Sort":
            self.BubbleSort()
            //            case "Selection Sort":
            //                self.SelectionSort()
            //            case "Insertion Sort":
            //                self.InsertionSort()
            //            case "Heap Sort":
            //                self.HeapSort()
            //            case "Cocktail Sort":
            //                self.CocktailSort()
            //            case "Block Sort":
            //                self.BlockSort()
            //            case "Merge Sort":
            //                self.MergeSort()
            //            case "Quick Sort":
            //                self.QuickSort()
            //            case "Cube Sort":
            //                self.CubeSort()
            //            case "Counting Sort":
            //                self.CountingSort()
            //            case "Radix Sort":
            //                self.RaidxSort()
            //            case "Spread Sort":
            //                self.SpreadSort()
            //            case "Bucket Sort":
            //                self.BucketSort()
            //            case "Pigeonhole Sort":
        //                self.PigeonholeSort()
        default:
            self.BubbleSort()
        }
    }
    
    
    func deselectBars() {
        for i in 0..<self.bars.count {
            self.bars[i].deselectBar(withColor: #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1))
        }
    }
    
    
    func BubbleSort() {
        var sortedAboveIndex = self.bars.count
        
        repeat {
            var lastSwapIndex = 0
            
            for i in stride(from: 1, to: sortedAboveIndex, by: 1) {
                if (self.bars[i - 1] > self.bars[i]) {
                    self.bars.swapAt(i, i - 1)
                    
                    UIView.animate(withDuration: 0.4, delay: Double(i), options: .curveLinear, animations: {
                        self.bars[i].swapPosition(bar: self.bars[i - 1])
                    }, completion: {(finished) in
                        self.redraw()
                    })
                    
                    lastSwapIndex = i
                }
            }
            
            sortedAboveIndex = lastSwapIndex
        } while (sortedAboveIndex != 0)
    }
    
    
    func InsertionSort() {
        //        for i in 1..<bars.count {
        //            var j = i
        //
        //            while j > 0 && bars[j].value < bars[j - 1].value {
        //                self.bars.swapAt(j - 1, j)
        //                self.bars[j - 1].swapPosition(bar: self.bars[j])
        //                j -= 1
        //            }
        //        }
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
    
    
    func CountingSort() {
        
    }
    
    
    func RaidxSort() {
        
    }
    
    
    func SpreadSort() {
        
    }
    
    
    func PigeonholeSort() {
        
    }
}
