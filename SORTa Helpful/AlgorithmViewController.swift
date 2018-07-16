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

    
    private let equationDict = [
        "O(n)"          : { (x: Double) -> Double in
            return x
        },
        "O(nlogn)"      : { (x: Double) -> Double in
            return x * log(x)
        },
        "O(n²)"         : { (x: Double) -> Double in
            return x * x
        },
        "O(n+r)"        : { (x: Double) -> Double in
            return x
        },
        "O(n(k/d))"     : { (x: Double) -> Double in
            return x
        },
        "O(n((k/s)+d))" : { (x: Double) -> Double in
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
    
    
    func graphViewSetup() {
        algorithmGraphView.addSubview(lineGraphView)
        lineGraphView.translatesAutoresizingMaskIntoConstraints = false
        lineGraphView.topAnchor.constraint(equalTo: algorithmGraphView.topAnchor).isActive = true
        lineGraphView.bottomAnchor.constraint(equalTo: algorithmGraphView.bottomAnchor).isActive = true
        lineGraphView.leadingAnchor.constraint(equalTo: algorithmGraphView.leadingAnchor).isActive = true
        lineGraphView.trailingAnchor.constraint(equalTo: algorithmGraphView.trailingAnchor).isActive = true
        lineGraphView.chartDescription?.text = ""
        
        lineGraphView.rightAxis.enabled = false
        lineGraphView.leftAxis.enabled = false
        
        lineGraphView.xAxis.enabled = false
        lineGraphView.legend.enabled = false
        lineGraphView.isUserInteractionEnabled = false
        
        lineGraphView.animate(xAxisDuration: 4, yAxisDuration: 4)
    }
    
    
    func drawGraphData() {
        let caseArray = [algorithm?.bestCase.0, algorithm?.averageCase.0, algorithm?.worstCase.0]
        let best = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1)
        let average = #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1)
        let worst = #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)
        
        let colors: [UIColor] = [best, average, worst]
        
        var dataSets: [LineChartDataSet] = []
        
        for i in 0..<3 {
            print(caseArray[i]!)
            var yVals: [ChartDataEntry] = []
            
            for y in stride(from: 0.0, to: Double(algorithmGraphView.frame.width), by: 1.0) {
                let equation = (equationDict[caseArray[i]!])!
                print(equation)
                let val = equation(Double(y))
                yVals.append(ChartDataEntry(x: y, y: val))
            }
            
            let set = LineChartDataSet(values: yVals, label: caseArray[i]!)
            set.mode = .cubicBezier
            set.drawCirclesEnabled = false
            set.lineWidth = 1.8
            set.circleRadius = 4
            set.setCircleColor(.white)
            set.highlightColor = colors[i]
            set.fillColor = .white
            set.fillAlpha = 1
            set.drawHorizontalHighlightIndicatorEnabled = false
            set.setColor(colors[i])
            
            dataSets.append(set)
        }
        
        let data = LineChartData(dataSets: dataSets)
        lineGraphView.data = data
    }
    
    
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
        drawGraphData()
        
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
