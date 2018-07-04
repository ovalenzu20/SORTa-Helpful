//
//  SearchViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchViewSearchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    
    let algorithmCollection : [SearchCellData] = [
        SearchCellData(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Shell Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)"),
        SearchCellData(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        
        let collectionWidth = (view.frame.size.width - 40) / 2
        let layout = searchCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionWidth, height: 120.0)
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = algorithmCollection[indexPath.item]
        let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell

        searchCell.setSearchButtonLabels(cellData: cellData)
        
        var colors: [UIColor] = [
            .red, .blue, .green, .yellow, .purple, .orange, .cyan, .magenta
        ]

        let r1 = arc4random_uniform(UInt32(colors.count))
        let randomFirst: UIColor = colors[Int(r1)]
        colors.remove(at: Int(r1))
        
        var r2 = arc4random_uniform(UInt32(colors.count))
        var randomSecond: UIColor = colors[Int(r2)]
        colors.remove(at: Int(r2))
        
        while randomFirst == randomSecond {
            r2 = arc4random_uniform(UInt32(colors.count))
            randomSecond = colors[Int(r2)]
        }
        
        searchCell.setGradientBackground(primary: randomFirst, secondary: randomSecond)
        
        return searchCell
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return algorithmCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}








