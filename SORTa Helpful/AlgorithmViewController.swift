//
//  AlgorithmViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/9/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit
import Charts



class AlgorithmViewController: UIViewController {
    
    private let algorithmFiles: [String: String] = [
        "Bubble Sort"     : "bubble_sort",
        "Selection Sort"  : "selection_sort",
        "Insertion Sort"  : "insertion_sort",
        "Heap Sort"       : "heap_sort.txt",
        "Cocktail Sort"   : "cocktail_sort",
        "Block Sort"      : "block_sort",
        "Merge Sort"      : "merge_sort",
        "Quick Sort"      : "quick_sort",
        "Cube Sort"       : "cube_sort",
        "Counting Sort"   : "counting_sort",
        "Radix Sort"      : "radix_sort",
        "Spread Sort"     : "spread_sort",
        "Bucket Sort"     : "bucket_sort",
        "Pigeonhole Sort" : "pigeonhole_sort"
    ]
    
    
    private let equationDict: [String: Any] = [
        "O(n)"          : { (x: Float) -> Float in
            return x
        },
        "O(nlogn)"      : { (x: Float) -> Float in
            return x * log(x)
        },
        "O(n²)"         : { (x: Float) -> Float in
            return x * x
        },
        "O(n+r)"        : { (x: Float) -> Float in
            return x
        },
        "O(n(k/d))"     : { (x: Float) -> Float in
            return x
        },
        "O(n((k/s)+d))" : { (x: Float) -> Float in
            return x
        }
    ]
    
    
    var algorithm: Algorithm?
    
    @IBOutlet weak var testSliderLabel: UILabel!
    
    @IBAction func algoAnimationSlider(_ sender: UISlider) {
        testSliderLabel.text = String(sender.value)
    }
    
    
    @IBOutlet weak var typeLabel:        UILabel!
    @IBOutlet weak var bestCaseLabel:    UILabel!
    @IBOutlet weak var averageCaseLabel: UILabel!
    @IBOutlet weak var worstCaseLabel:   UILabel!
    @IBOutlet weak var memoryLabel:      UILabel!
    @IBOutlet weak var infoLabel:        UILabel!
    @IBOutlet weak var pseudocodeLabel:  UILabel!
    @IBOutlet weak var aboutAlgorithmSectionLabel: UILabel!
    @IBOutlet weak var algorithmScrollView: UIScrollView!
    
    
    @IBOutlet weak var algorithmGraphView: UIView!
    let lineGraphView = LineChartView()
    
//    func generateAlgorithmGraphForCase(algoCase: String) {
//        let graph = LineChartView()
//
//        for i in stride(from: 0.0, to: algorithmGraphView.frame.width, by: 0.1) {
//            let dataEntry = ChartDataEntry(x: Double(i), y: Double(equationDict[algoCase](i)))
//            data.append(dataEntry)
//        }
//
//
//    }
    
    
    func graphViewSetup() {
        algorithmGraphView.addSubview(lineGraphView)
        lineGraphView.translatesAutoresizingMaskIntoConstraints = false
        lineGraphView.topAnchor.constraint(equalTo: algorithmGraphView.topAnchor).isActive = true
        lineGraphView.bottomAnchor.constraint(equalTo: algorithmGraphView.bottomAnchor).isActive = true
        lineGraphView.leadingAnchor.constraint(equalTo: algorithmGraphView.leadingAnchor).isActive = true
        lineGraphView.trailingAnchor.constraint(equalTo: algorithmGraphView.trailingAnchor).isActive = true
    }
    
    
//    func setChart(dataPoints: [String], values: [Double]) {
//
//        var data: [ChartDataEntry] = []
//
//        for i in stride(from: 0.0, to: algorithmGraphView.frame.width, by: 0.1) {
//            let dataEntry = ChartDataEntry(x: x, y: <#T##Double#>)
//            data.append(dataEntry)
//        }
//
//
//        let lineChartDataSet = LineChartDataSet(yVals: data, label: "Units Sold")
//        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
//        lineChartView.data = lineChartData
//    }
    
    
    func getPseudocodeFromFile(algoName: String) -> String {
        let fileUrl = Bundle.main.path(forResource: algorithmFiles[algoName]!, ofType: "txt")
        
        var pseudoCodeString = ""
        
        do {
            pseudoCodeString = try String(contentsOfFile: fileUrl!, encoding: .utf8)
            pseudoCodeString.removeLast()
        } catch let error as NSError {
            print(error.localizedDescription)
            return "Error loading pseudocode"
        }
        
        return pseudoCodeString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphViewSetup()
        
        if algorithm != nil {
            let algoName = algorithm?.name
            self.title = algoName!.uppercased()
            
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 20)!]
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            
            typeLabel.text        = algorithm?.algoType
            bestCaseLabel.text    = algorithm?.bestCase.0
            averageCaseLabel.text = algorithm?.averageCase.0
            worstCaseLabel.text   = algorithm?.worstCase.0
            memoryLabel.text      = algorithm?.memory
            infoLabel.text        = algorithm?.info
            aboutAlgorithmSectionLabel.text = "ABOUT " +  (algorithm?.name)!.uppercased()
            pseudocodeLabel.text  = getPseudocodeFromFile(algoName: (algorithm?.name)!)
        }
    }
}
