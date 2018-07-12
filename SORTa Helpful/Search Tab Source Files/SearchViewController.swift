//
//  SearchViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var searchedAlgorithms: [Algorithm] = Array()
    var sortedByName:    Bool = false
    var sortedByBest:    Bool = false
    var sortedByAverage: Bool = false
    var sortedByWorst:   Bool = false
    
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var nameFilterButton:    SearchFilterButton!
    @IBOutlet weak var bestFilterButton:    SearchFilterButton!
    @IBOutlet weak var averageFilterButton: SearchFilterButton!
    @IBOutlet weak var worstFilterButton:   SearchFilterButton!
    
    
    @IBAction func nameFilterActionButton(_ sender: SearchFilterButton) {
        if nameFilterButton.buttonIsSelected() {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = false
            
            nameFilterButton.isSelected = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.removeAll()
            
            for algo in algorithmCollection {
                searchedAlgorithms.append(algo)
            }
            
            searchCollectionView.reloadData()
        }
        else {
            sortedByName    = true
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = false
            
            nameFilterButton.setSelectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.name < algo2.name
            })
            
            searchCollectionView.reloadData()
        }
    }
    
    @IBAction func bestFilterActionButton(_ sender: SearchFilterButton) {
        if bestFilterButton.buttonIsSelected() {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = false
            
            bestFilterButton.isSelected = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.removeAll()
            
            for algo in algorithmCollection {
                searchedAlgorithms.append(algo)
            }
            
            searchCollectionView.reloadData()
        }
        else {
            sortedByName    = false
            sortedByBest    = true
            sortedByAverage = false
            sortedByWorst   = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setSelectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.bestCase.1 < algo2.bestCase.1
            })
            
            searchCollectionView.reloadData()
        }
    }
    
    
    @IBAction func averageFilterActionButton(_ sender: SearchFilterButton) {
        if averageFilterButton.buttonIsSelected() {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = false
            
            averageFilterButton.isSelected = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.removeAll()
            
            for algo in algorithmCollection {
                searchedAlgorithms.append(algo)
            }
            
            searchCollectionView.reloadData()
        }
        else {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = true
            sortedByWorst   = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setSelectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.averageCase.1 < algo2.averageCase.1
            })
            
            searchCollectionView.reloadData()
        }
    }
    
    
    @IBAction func worstFilterActionButton(_ sender: SearchFilterButton) {
        if worstFilterButton.buttonIsSelected() {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = false
            
            worstFilterButton.isSelected = false
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setUnselectedProperties()
            
            searchedAlgorithms.removeAll()
            
            for algo in algorithmCollection {
                searchedAlgorithms.append(algo)
            }
            
            searchCollectionView.reloadData()
        }
        else {
            sortedByName    = false
            sortedByBest    = false
            sortedByAverage = false
            sortedByWorst   = true
            
            nameFilterButton.setUnselectedProperties()
            bestFilterButton.setUnselectedProperties()
            averageFilterButton.setUnselectedProperties()
            worstFilterButton.setSelectedProperties()
            
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.worstCase.1 < algo2.worstCase.1
            })
            
            searchCollectionView.reloadData()
        }
    }
    
    
    private let algorithmCollection : [Algorithm] = [
        Algorithm(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10),      averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(n²)"),
        Algorithm(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlogn)", 6), worstCase: ("O(nlogn)", 6),    memory: "O(1)"),
        Algorithm(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlogn)", 6), worstCase: ("O(nlogn)", 6),    memory: "O(1)"),
        Algorithm(name: "Merge Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlogn)", 6), averageCase: ("O(nlogn)", 6), worstCase: ("O(nlogn)", 6),    memory: "O(n)"),
        Algorithm(name: "Quick Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlogn)", 6), averageCase: ("O(nlogn)", 6), worstCase: ("O(n²)", 10),        memory: "O(log(n))"),
        Algorithm(name: "Cube Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlogn)", 6), worstCase: ("O(nlogn)", 6),    memory: "O(n)"),
        Algorithm(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+r)", 2),     worstCase: ("O(n+r)", 2),        memory: "O(n+r)"),
        Algorithm(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n(k/d))", 3),  worstCase: ("O(n(k/d))", 3),     memory: "O(n+2ᵈ)"),
        Algorithm(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n(k/d))", 3),  worstCase: ("O(n((k/s)+d))", 4), memory: "O(n+2ᵈ)"),
        Algorithm(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+r)", 2),     worstCase: ("O(n+r)", 2),        memory: "O(n+r)"),
        Algorithm(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+2ᵏ)", 5),    worstCase: ("O(n+2ᵏ)", 5),       memory: "O(2ᵏ)"),
    ]
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var algorithmViewController = segue.destination as! AlgorithmViewController
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.attributedPlaceholder = NSAttributedString(string:"Search for an algorithm", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Roboto", size: 14)!])
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        searchTextField.delegate = self
        
        let collectionWidth = (view.frame.size.width - 60) / 2
        let layout = searchCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionWidth, height: 100.0)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        for algo in algorithmCollection {
            searchedAlgorithms.append(algo)
        }
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = searchedAlgorithms[indexPath.item]
        let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell

        searchCell.setSearchButtonLabels(cellData: cellData)
        
        if sortedByName {
            searchCell.setComplexityLabel(complexity: "")
        }
        else if sortedByBest {
            searchCell.setComplexityLabel(complexity: cellData.bestCase.0)
        }
        else if sortedByAverage {
            searchCell.setComplexityLabel(complexity: cellData.averageCase.0)
        }
        else if sortedByWorst {
            searchCell.setComplexityLabel(complexity: cellData.worstCase.0)
        }
        else {
           searchCell.setComplexityLabel(complexity: "")
        }
        
        
        
//        var colors: [UIColor] = [
//            .red, .blue, .green, .yellow, .purple, .orange, .cyan, .magenta
//        ]
//
//        let r1 = arc4random_uniform(UInt32(colors.count))
//        let randomFirst: UIColor = colors[Int(r1)]
//        colors.remove(at: Int(r1))
//
//        var r2 = arc4random_uniform(UInt32(colors.count))
//        var randomSecond: UIColor = colors[Int(r2)]
//        colors.remove(at: Int(r2))
//
//        while randomFirst == randomSecond {
//            r2 = arc4random_uniform(UInt32(colors.count))
//            randomSecond = colors[Int(r2)]
//        }
//
//        searchCell.setGradientBackground(primary: randomFirst, secondary: randomSecond)
        
//        var primary: UIColor
//        var secondary: UIColor
//
//        if cellData.algoClass == "Comparison" {
//            primary   = .orange
//            secondary = .red
//        }
//        else {
//            primary   = .blue
//            secondary = .green
//        }
        
//        searchCell.setGradientBackground(primary: primary, secondary: secondary)
        
        searchCell.backgroundColor = #colorLiteral(red: 0, green: 0.4352941176, blue: 1, alpha: 1)
        
        return searchCell
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedAlgorithms.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let currentAlgorithm = searchedAlgorithms[indexPath.item]
        
        searchCell.isHighlighted = true
        
        let algorithmVC = storyboard?.instantiateViewController(withIdentifier: "AlgorithmViewController") as? AlgorithmViewController
        
        algorithmVC?.algorithm = currentAlgorithm
        
        self.navigationController?.pushViewController(algorithmVC!, animated: true)
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        searchTextField.text = ""
        
        searchedAlgorithms.removeAll()
        
        for algo in algorithmCollection {
            searchedAlgorithms.append(algo)
        }
        
        searchCollectionView.reloadData()
        
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (searchTextField.text?.count)! != 0 {
            searchedAlgorithms.removeAll()
            
            for algo in algorithmCollection {
                let range = algo.name.lowercased().range(of: searchTextField.text!, options: .caseInsensitive, range: nil, locale: nil)
                
                if range != nil {
                    searchedAlgorithms.append(algo)
                }
            }
        }
        
        searchCollectionView.reloadData()
        
        return true
    }
}









