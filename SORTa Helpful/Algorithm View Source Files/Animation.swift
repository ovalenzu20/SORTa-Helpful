//
//  Animation.swift
//  SORTa Helpful
//
//  Created by Teran on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class Animation {
    var elements: [Element]
    
    
    init(elements: [Element]) {
        self.elements = elements
    }
    
    
    func setElementValues(elements: [Element]) {
        self.elements = elements
    }
    
    
    func BubbleSort() {
        var sortedAboveIndex = elements.count
        
        repeat {
            var lastSwapIndex = 0
            print(elements)
            
            for i in stride(from: 1, to: sortedAboveIndex, by: 1) {
                if (elements[i - 1].value > elements[i].value) {
                    elements.swapAt(i, i - 1)
                    lastSwapIndex = i
                }
            }
            
            sortedAboveIndex = lastSwapIndex
            
        } while (sortedAboveIndex != 0)
    }
    
    
    func InsertionSort() {
        for i in 1..<elements.count {
            var j = i
            
            while j > 0 && elements[j].value < elements[j - 1].value {
                elements.swapAt(j - 1, j)
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
