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
    private let viewWidth: CGFloat = 400
    private let viewHeight: CGFloat = 300
    private let delayInSeconds: Double = 0.003
    
    private var array: [Int] = []
    private let updateOperations = OperationQueue()
//    private var delayOperation: DelayOperation? = nil
    
    
    public func setup(array: [Int]) {
//        let delayOperation = DelayOperation(self.delayInSeconds)
        for i in 0..<array.count {
            self.array.append(array[i])
        }
        
        self.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        updateOperations.maxConcurrentOperationCount = 1
    }
    
    /// Add an Operation to re-draw bars after a delay.
    public func update(with values: [Int]) {
        let updateOperation = BlockOperation { [weak self] in
            self?.drawBars(with: values)
        }
        updateOperations.addOperation(DelayOperation(self.delayInSeconds))
        updateOperations.addOperation(updateOperation)
    }
    
    
    private func drawBars(with values: [Int]) {
        if subviews.count != values.count {
            addSubviews(values.count)
        }
        
        for (index, bar) in subviews.enumerated() {
            configure(bar, at: index, values: values)
        }
        
        // Force the playground to re-render.
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
    
    private func configure(_ bar: UIView, at index: Int, values: [Int]) {
        let barWidth = frame.width / CGFloat(values.count)
        
        let x = barWidth * CGFloat(index)
        
        let value = values[index]
        let maxValue = values.max() ?? 0
        let percentage = CGFloat(value)/CGFloat(maxValue)
        let height = frame.height * percentage
        
        bar.frame = CGRect(x: x, y: frame.height - height, width: barWidth, height: height)
        
//        let borderWidth: CGFloat = bar.frame.width/12
//        bar.layer.borderWidth = borderWidth
        bar.layer.borderColor = UIColor.black.cgColor
        bar.backgroundColor = barColor(for: percentage)
    }
    
    private func barColor(for percentage: CGFloat) -> UIColor {
        return UIColor(hue: percentage, saturation: 0.6, brightness: 1.0, alpha: 1.0)
    }
    
    
    
    func runAlgorithmAnimation(algorithm: String) {
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
            //                self.RadixSort()
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
    
    
    func BubbleSort() {
        var isSorted: Bool
        
        repeat {
            isSorted = true
            
            for i in 0..<self.array.count - 1 {
                if array[i] > array[i + 1] {
                    self.array.swapAt(i, i + 1)
                    self.update(with: array)
                    isSorted = false
                }
            }
        } while (!isSorted)
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
    
    
    func CountingSort() {
        
    }
    
    
    func RaidxSort() {
        
    }
    
    
    func SpreadSort() {
        
    }
    
    
    func PigeonholeSort() {
        
    }
}
