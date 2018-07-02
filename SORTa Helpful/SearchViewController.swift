//
//  SearchViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let algorithmCollection : [String : [SearchCellButtonData]] =
    [
        "Comparison"     : [
            SearchCellButtonData(name: "Bubble Sort",    algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Selection Sort", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Insertion Sort", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Heap Sort",      algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Shell Sort",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Cocktail Sort",  algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Block Sort",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Selection Sort", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        ],
        "Non-comparison" : [
            SearchCellButtonData(name: "Counting Sort",   algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Radix Sort",      algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Spread Sort",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Bucket Sort",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Pigeonhole Sort", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        ]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
