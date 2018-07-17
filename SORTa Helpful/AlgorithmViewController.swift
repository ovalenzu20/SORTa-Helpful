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
import SpriteKit



class AlgorithmViewController: UIViewController {
    
    private let algorithmFiles: [String: String] = [
        "Bubble Sort"     : "bubble_sort",
        "Selection Sort"  : "selection_sort",
        "Insertion Sort"  : "insertion_sort",
        "Heap Sort"       : "heap_sort",
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
        1  : { (x: Double) -> Double in
            return x
        },
        2  : { (x: Double) -> Double in
            return x
        },
        3  : { (x: Double) -> Double in
            return x
        },
        4  : { (x: Double) -> Double in
            return x
        },
        5  : { (x: Double) -> Double in
            return x
        },
        6  : { (x: Double) -> Double in
            var result = log(x)
            result = x * result
            return result
        },
        10 : { (x: Double) -> Double in
            return x * x
        }
    ]
    
    
    var algorithm: Algorithm?
    
    
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
    
    let colors: [UIColor] = [#colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1), #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)]
    let lineGraphViewArray = [LineChartView(), LineChartView(), LineChartView()]
    
    
    func graphViewSetup() {
        for lineGraphView in lineGraphViewArray {
            algorithmGraphView.addSubview(lineGraphView)
            lineGraphView.translatesAutoresizingMaskIntoConstraints = false
            lineGraphView.topAnchor.constraint(equalTo: algorithmGraphView.topAnchor).isActive = true
            lineGraphView.bottomAnchor.constraint(equalTo: algorithmGraphView.bottomAnchor).isActive = true
            lineGraphView.leadingAnchor.constraint(equalTo: algorithmGraphView.leadingAnchor).isActive = true
            lineGraphView.trailingAnchor.constraint(equalTo: algorithmGraphView.trailingAnchor).isActive = true
            lineGraphView.chartDescription?.text   = ""
            lineGraphView.rightAxis.enabled        = false
            lineGraphView.leftAxis.enabled         = false
            lineGraphView.xAxis.enabled            = false
            lineGraphView.legend.enabled           = false
            lineGraphView.isUserInteractionEnabled = false
            lineGraphView.animate(xAxisDuration: 4, yAxisDuration: 4)
        }
    }
    
    
    func drawGraphData(caseKey: Int, lineGraphView: LineChartView, lineColor: UIColor, offset: Int) {
        var yVals: [ChartDataEntry] = Array()
        print(offset)
        
        for x in stride(from: 1, to: Double(algorithmGraphView.frame.width), by: 1) {
            let equation = (equationDict[caseKey])!
            let val = equation(x)
            let dataEntry = ChartDataEntry(x: x + Double((offset) * 10), y: val + Double(offset))
            print("(\(x + Double((offset) * 100)), \(val))")
            yVals.append(dataEntry)
        }
        
        let set = LineChartDataSet(values: yVals, label: "")
        set.mode = .horizontalBezier
        set.drawCirclesEnabled = false
        set.lineWidth = 2.0
        set.highlightColor = lineColor
        set.fillAlpha = 1
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.setColor(lineColor)

        let data = LineChartData(dataSet: set)
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
        
        let caseArray = [algorithm!.bestCase.1, algorithm!.averageCase.1, algorithm!.worstCase.1]
        let colors: [UIColor] = [#colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1), #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)]
        
        for i in 0..<caseArray.count {
            drawGraphData(caseKey: caseArray[i], lineGraphView: lineGraphViewArray[i], lineColor: colors[i], offset: i + 1)
        }
        
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
