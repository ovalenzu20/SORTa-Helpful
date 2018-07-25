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
    
 
    @IBOutlet weak var datasetSizeLabel: UILabel!
    @IBOutlet weak var algorithmArrayView:         ArrayStackView!
    @IBOutlet weak var typeLabel:                  UILabel!
    @IBOutlet weak var bestCaseLabel:              UILabel!
    @IBOutlet weak var averageCaseLabel:           UILabel!
    @IBOutlet weak var worstCaseLabel:             UILabel!
    @IBOutlet weak var memoryLabel:                UILabel!
    @IBOutlet weak var infoLabel:                  UILabel!
    @IBOutlet weak var pseudocodeLabel:            UILabel!
    @IBOutlet weak var aboutAlgorithmSectionLabel: UILabel!
    @IBOutlet weak var algorithmScrollView:        UIScrollView!
    @IBOutlet weak var algorithmGraphView:         UIView!
    
    
    var isPlaying: Bool = false
    @IBOutlet weak var playButton: UIButton!
    @IBAction @objc func playAnimation(_ sender: UIButton) {
        if isPlaying {
            isPlaying = false
            self.resetAnimation()
            algorithmArrayView.runAlgorithmAnimation(algorithm: (algorithm?.name)!)
        }
        else {
            isPlaying = true
            algorithmArrayView.runAlgorithmAnimation(algorithm: (algorithm?.name)!)
        }
    }
    
    
    @IBOutlet weak var animationSlider: UISlider!
    @IBAction @objc func slideThroughAnimation(_ sender: UISlider) {
        datasetSizeLabel.text = "SIZE OF DATASET:   \(Int(sender.value) * 10)"
        self.resetAnimation()
    }
    
    
    @IBOutlet weak var stopButton: UIButton!
    @IBAction @objc func stopAnimation(_ sender: UIButton) {
        
    }
    
    
    private let colors             = [#colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1), #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)]
    private let lineGraphViewArray = [LineChartView(), LineChartView(), LineChartView()]
    
    
    private func randomArray(length: Int, max: Int) -> [Int] {
        var array = [Int]()
        
        let min = max / 30
        for _ in 1...length {
            let randomDiff = Int(arc4random_uniform(UInt32(max - min)))
            array.append(min + randomDiff)
        }
        
        return array
    }
    
    
    func resetAnimation() {
        setupAlgorithmAnimationView()
    }
    
    
    func setupAlgorithmAnimationView() {
        let array = self.randomArray(length: Int(animationSlider.value) * 10, max: 100)
        algorithmArrayView.setup(array: array)
    }
    
    
    func setupAnimationButtons() {
        playButton.setImage(#imageLiteral(resourceName: "play-arrow"), for: .normal)
        playButton.imageEdgeInsets = UIEdgeInsetsMake(12, 15, 12, 10)
        stopButton.setImage(#imageLiteral(resourceName: "stop-button"), for: .normal)
        stopButton.imageEdgeInsets = UIEdgeInsetsMake(13, 13, 13, 13)
    }
    
    
    func graphViewSetup() {
        var offset = 0
        var bound  = 80
        
        for lineGraphView in lineGraphViewArray {
            algorithmGraphView.addSubview(lineGraphView)
            lineGraphView.translatesAutoresizingMaskIntoConstraints = false
            lineGraphView.topAnchor.constraint(equalTo: algorithmGraphView.topAnchor).isActive = true
            lineGraphView.bottomAnchor.constraint(equalTo: algorithmGraphView.bottomAnchor).isActive = true
            lineGraphView.leadingAnchor.constraint(equalTo: algorithmGraphView.leadingAnchor, constant: CGFloat(offset)).isActive = true
            lineGraphView.trailingAnchor.constraint(equalTo: algorithmGraphView.trailingAnchor, constant: CGFloat(-bound)).isActive = true
            lineGraphView.chartDescription?.text   = ""
            lineGraphView.rightAxis.enabled        = false
            lineGraphView.leftAxis.enabled         = false
            lineGraphView.xAxis.enabled            = false
            lineGraphView.legend.enabled           = false
            lineGraphView.isUserInteractionEnabled = false
            lineGraphView.animate(xAxisDuration: 4, yAxisDuration: 4)
            
            offset += 40
            bound  -= 40
        }
    }
    
    
    func drawGraphData(caseKey: Int, lineGraphView: LineChartView, lineColor: UIColor) {
        var yVals: [ChartDataEntry] = Array()
        
        for x in stride(from: 1.0, to: 500.0, by: 1.0) {
            let equation = (equationDict[caseKey])!
            let val = equation(x)
            let dataEntry = ChartDataEntry(x: x, y: val)
            yVals.append(dataEntry)
        }
        
        let set = LineChartDataSet(values: yVals, label: "")
        set.mode = .horizontalBezier
        set.drawCirclesEnabled = false
        set.lineWidth = 1.0
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
        
        setupAlgorithmAnimationView()
        setupAnimationButtons()
//        playButton.addTarget(self, action: #selector(playAnimation), for: UIControlEvents.touchUpInside)
//        animationSlider.addTarget(self, action: #selector(slideThroughAnimation), for: .valueChanged)
//        stopButton.addTarget(self, action: #selector(stopAnimation), for: UIControlEvents.touchUpInside)
        
        graphViewSetup()
        
        let caseArray = [algorithm!.bestCase, algorithm!.averageCase, algorithm!.worstCase]
        let colors: [UIColor] = [#colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1), #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1), #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)]
        
        for i in 0..<caseArray.count {
            drawGraphData(caseKey: caseArray[i].1, lineGraphView: lineGraphViewArray[i], lineColor: colors[i])
        }
        
        if algorithm != nil {
            let algoName = algorithm?.name
            self.title = algoName!.uppercased()
            
            let attributes = [NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 24)!, NSAttributedStringKey.foregroundColor: UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = attributes
            
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
