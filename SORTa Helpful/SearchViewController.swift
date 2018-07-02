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
            SearchCellButtonData(name: "Bubble Sort",    bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Selection Sort", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Insertion Sort", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Heap Sort",      bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Shell Sort",     bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Cocktail Sort",  bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Block Sort",     bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Selection Sort", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        ],
        "Non-comparison" : [
            SearchCellButtonData(name: "Counting Sort",   bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Radix Sort",      bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Spread Sort",     bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Bucket Sort",     bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
            SearchCellButtonData(name: "Pigeonhole Sort", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        ]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
