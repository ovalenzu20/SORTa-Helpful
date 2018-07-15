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
        "Bubble Sort"     : "SupportingFiles/bubble_sort.txt",
        "Selection Sort"  : "SupportingFiles/selection_sort.txt",
        "Insertion Sort"  : "SupportingFiles/insertion_sort.txt",
        "Heap Sort"       : "SupportingFiles/heap_sort.txt",
        "Cocktail Sort"   : "SupportingFiles/cocktail_sort.txt",
        "Block Sort"      : "SupportingFiles/block_sort.txt",
        "Merge Sort"      : "SupportingFiles/merge_sort.txt",
        "Quick Sort"      : "SupportingFiles/quick_sort.txt",
        "Cube Sort"       : "SupportingFiles/cube_sort.txt",
        "Counting Sort"   : "SupportingFiles/counting_sort.txt",
        "Radix Sort"      : "SupportingFiles/radix_sort.txt",
        "Spread Sort"     : "SupportingFiles/spread_sort.txt",
        "Bucket Sort"     : "SupportingFiles/bucket_sort.txt",
        "Pigeonhole Sort" : "SupportingFiles/pigeonhole_sort.txt"
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
    
    
    func getPseudocodeFromFile(file: String) {
        
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
            
            
            
//            pseudocodeLabel.text  = algorithm?.pseudocode
        }
    }
}
