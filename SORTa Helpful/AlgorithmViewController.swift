//
//  AlgorithmViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/9/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import UIKit


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
    
    @IBOutlet weak var algorithmScrollView: UIScrollView!
    
    
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
            pseudocodeLabel.text  = getPseudocodeFromFile(algoName: (algorithm?.name)!)
        }
    }
}
