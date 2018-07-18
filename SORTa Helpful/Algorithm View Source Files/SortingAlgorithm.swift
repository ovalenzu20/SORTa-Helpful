//
//  AlgorithmBase.swift
//  SORTa Helpful
//
//  Created by Teran on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


class SortingAlgorithm {
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
