//
//  ArrayView.swift
//  SORTa Helpful
//
//  Created by Teran on 7/23/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import Dispatch

public class ArrayStackView: UIView {
    private var viewWidth          : CGFloat        = 0
    private var viewHeight         : CGFloat        = 0
    private var delayInSeconds     : Double         = 0.001
    private var array              : [Int]          = []
    public  var updateOperations   : OperationQueue = OperationQueue()
    
    
    public func setup(array: [Int], width: CGFloat, height: CGFloat) {
        self.array      = Array(array)
        self.viewWidth  = width
        self.viewHeight = height
        self.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        updateOperations.maxConcurrentOperationCount = 1
    }
    
    
    public func update(with values: [Int], hIndex: Int) {
        let updateOperation = BlockOperation { [weak self] in
            self?.drawBars(with: values, hIndex: hIndex)
        }
        updateOperations.addOperation(DelayOperation(self.delayInSeconds))
        updateOperations.addOperation(updateOperation)
    }
    
    
    private func drawBars(with values: [Int], hIndex: Int) {
        if subviews.count != values.count {
            addSubviews(values.count)
        }
        
        for (index, bar) in subviews.enumerated() {
            if index == hIndex {
                configure(bar, at: index, values: values, isHighlightedBar: true)
            }
            else {
                configure(bar, at: index, values: values, isHighlightedBar: false)
            }
        }
        
        CATransaction.flush()
    }
    

    private func addSubviews(_ count: Int) {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        for _ in 1...count {
            let bar = UIView()
            bar.translatesAutoresizingMaskIntoConstraints = false
            addSubview(bar)
        }
    }
    
    
    private func configure(_ bar: UIView, at index: Int, values: [Int], isHighlightedBar: Bool) {
        let barWidth = frame.width / CGFloat(values.count)
        
        let x = barWidth * CGFloat(index)
        
        let value = values[index]
        let maxValue = values.max() ?? 0
        let percentage = CGFloat(value)/CGFloat(maxValue)
        let height = frame.height * percentage
        
        bar.frame = CGRect(x: x, y: frame.height - height, width: barWidth, height: height)
        if isHighlightedBar {
            bar.backgroundColor = .red
        }
        else {
            bar.backgroundColor = barColor(for: percentage)
        }
    }
    
    
    private func barColor(for percentage: CGFloat) -> UIColor {
        return UIColor(hue: percentage, saturation: 0.6, brightness: 1.0, alpha: 1.0)
    }
    
    
    func reset() {
        self.updateOperations.cancelAllOperations()
        self.updateOperations = OperationQueue()
    }
    
    
    func runAlgorithmAnimation(algorithm: String) {
        switch algorithm {
        case "Bubble Sort":
            self.BubbleSort()
        case "Selection Sort":
            self.SelectionSort()
        case "Insertion Sort":
            self.InsertionSort()
            //            case "Heap Sort":
            //                self.HeapSort()
        case "Cocktail Sort":
            self.CocktailSort()
            //            case "Block Sort":
            //                self.BlockSort()
        case "Merge Sort":
            self.MergeSort(from: 0, a: &self.array)
            //            case "Quick Sort":
            //                self.QuickSort()
            //            case "Cube Sort":
            //                self.CubeSort()
        case "Counting Sort":
            self.CountingSort()
        case "Radix Sort":
            self.RadixSort()
            //            case "Spread Sort":
            //                self.SpreadSort()
            //            case "Bucket Sort":
            //                self.BucketSort()
        case "Pigeonhole Sort":
            self.PigeonholeSort()
        default:
            self.BubbleSort()
        }
    }
    
    
    func BubbleSort() {
        self.delayInSeconds = 0.001
        var isSorted: Bool
        
        repeat {
            isSorted = true
            
            for i in 0..<self.array.count - 1 {
                self.update(with: self.array, hIndex: i)
                
                if self.array[i] > self.array[i + 1] {
                    self.array.swapAt(i, i + 1)
                    self.update(with: self.array, hIndex: -1)
                    isSorted = false
                }
            }
        } while (!isSorted)
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    func InsertionSort() {
        self.delayInSeconds = 0.001
        for x in 1..<self.array.count {
            var y = x
            self.update(with: self.array, hIndex: y - 1)
            
            while y > 0 && self.array[y] < self.array[y - 1] {
                self.update(with: self.array, hIndex: y - 1)
                self.array.swapAt(y - 1, y)
                self.update(with: self.array, hIndex: -1)
                y -= 1
            }
        }
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    func QuickSort() {
        
    }
    
    
    func SelectionSort() {
        self.delayInSeconds = 0.001
        for x in 0 ..< self.array.count - 1 {
            var lowest = x
            for y in x + 1 ..< self.array.count {
                self.update(with: self.array, hIndex: y)
                
                if self.array[y] < self.array[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {
                self.array.swapAt(x, lowest)
                self.update(with: self.array, hIndex: -1)
            }
        }
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    func HeapSort() {
        
    }
    
    
    func CocktailSort() {
        self.delayInSeconds = 0.001
        var swapped = true
        var start = 0
        var end = self.array.count - 1
        
        while swapped {
            swapped = false
            
            
            for i in start..<end {
                self.update(with: self.array, hIndex: i)
                
                if self.array[i] > self.array[i + 1] {
                    self.array.swapAt(i, i + 1)
                    self.update(with: self.array, hIndex: -1)
                    swapped = true
                }
            }
            
            if (!swapped) {
                break
            }
            
            swapped = false
            end -= 1
            
            var i = end - 1
            
            while i >= start {
                self.update(with: self.array, hIndex: i)
                if (self.array[i] > self.array[i + 1]) {
                    self.array.swapAt(i, i + 1);
                    self.update(with: self.array, hIndex: -1)
                    swapped = true;
                }
                
                i -= 1
            }
            
            start += 1
        }
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    private func merge(from start: Int, _ left: [Int], _ right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
            
            // Update Method A - Update after each element was appended
            let remainingLeft  = Array(left[leftIndex   ..< left.count])
            let remainingRight = Array(right[rightIndex ..< right.count])
            let newValues      = orderedArray + remainingLeft + remainingRight
            
            self.array.replace(newValues, startingIndex: start)
//            self.update(with: self.array)
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
    
    // Note the 'start' param is used for display, not the algorithm.
    func MergeSort(from start: Int, a: inout [Int]) {
        guard a.count > 1 else { return }
        
        let midIndex = a.count / 2
        var left = Array(self.array[0 ..< midIndex])
        var right = Array(self.array[midIndex ..< a.count])
        
        MergeSort(from: start, a: &left)
        MergeSort(from: start + midIndex, a: &right)
        
        self.array = merge(from: start, left, right)
        
        // Update Method B - Only update after merging two arrays
        // arrayView.replaceValues(newValues: a, startingFrom: start)
    }
    
    
    func BlockSort() {
        
    }
    
    
    func BucketSort() {
        
    }
    
    
    func CubeSort() {
        
    }
    
    
    func CountingSort() {
        self.delayInSeconds = 0.01
        let maxElement = self.array.max() ?? 0
        
        var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
        
        var i: Int = 0
        for element in self.array {
            self.update(with: self.array, hIndex: i)
            countArray[element] += 1
            i += 1
        }
        
        i = 0
        for index in 1 ..< countArray.count {
            self.update(with: self.array, hIndex: i)
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
            i += 1
        }
        
        
        var sortedArray = [Int](repeating: 0, count: array.count)
        
        i = 0
        for element in self.array {
            self.update(with: self.array, hIndex: i)
            countArray[element] -= 1
            sortedArray[countArray[element]] = element
            i += 1
        }
        
        for i in 0..<sortedArray.count {
            self.update(with: self.array, hIndex: i)
            self.array[i] = sortedArray[i]
        }
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    func RadixSort() {
        self.delayInSeconds = 0.01
        let radix = 10
        var done = false
        var index: Int
        var digit = 1
        while !done {
            done = true
            var buckets: [[Int]] = []
            for _ in 1...radix {
                buckets.append([])
            }
            
            for number in self.array {
                self.update(with: self.array, hIndex: number)
                index = number / digit
                buckets[index % radix].append(number)
                
                if done && index > 0 {
                    done = false
                }
            }
            
            var i = 0
            
            for j in 0..<radix {
                let bucket = buckets[j]
                for number in bucket {
                    self.update(with: self.array, hIndex: i)
                    self.array[i] = number
                    
                    i += 1
                }
            }
            
            digit *= radix
        }
        
        self.update(with: self.array, hIndex: -1)
    }
    
    
    func SpreadSort() {
        
    }
    
    
    func PigeonholeSort() {
        self.delayInSeconds = 0.01
        var min = self.array[0]
        var max = self.array[0]

        for i in 0..<self.array.count {
            self.update(with: self.array, hIndex: i)
            if (self.array[i] < min) {
                min = self.array[i]
            }
            if (self.array[i] > max) {
                max = self.array[i]
            }
        }

        let range = max - min + 1
        var holes: [Int] = Array(repeating: 0, count: range)
        
        for x in 0..<self.array.count {
            self.update(with: self.array, hIndex: x)
            holes[self.array[x] - min] = holes[self.array[x] - min] + 1
        }
        
        var i = 0;
        
        for count in 0..<range {
            while holes[count] > 0 {
                self.update(with: self.array, hIndex: i)
                holes[count] -= 1
                self.array[i] = count + min
                i += 1
            }
            
            self.update(with: self.array, hIndex: -1)
        }
        
        self.update(with: self.array, hIndex: -1)
    }
}


public extension Array where Iterator.Element == Int {
    public mutating func replace(_ newValues: [Int], startingIndex: Int) {
        let newSubRange = startingIndex..<(startingIndex + newValues.count)
        self.replaceSubrange(newSubRange, with: newValues)
    }
}


//extension Heap {
//    public mutating func sort() -> [T] {
//        for i in stride(from: (elements.count - 1), through: 1, by: -1) {
//            swap(&elements[0], &elements[i])
//            shiftDown(0, heapSize: i)
//        }
//        return elements
//    }
//}
