//
//  SearchViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var nameFilterButton: SearchFilterButton!
    @IBOutlet weak var bestFilterButton: SearchFilterButton!
    @IBOutlet weak var averageFilterButton: SearchFilterButton!
    @IBOutlet weak var worstFilterButton: SearchFilterButton!
    
    @IBAction func nameFilterActionButton(_ sender: SearchFilterButton) {
//        if nameFilterButton.state != .disabled {
//            nameFilterButton.setSelectedProperties()
//        }
//        else {
//            nameFilterButton.setUnselectedProperties()
//        }
        
        nameFilterButton.setSelectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setUnselectedProperties()
        
        searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
            return algo1.name < algo2.name
        })
        
        searchCollectionView.reloadData()
    }
    
    @IBAction func bestFilterActionButton(_ sender: SearchFilterButton) {
//        if bestFilterButton.state == .selected {
//            bestFilterButton.setSelectedProperties()
//        }
//        else {
//            bestFilterButton.setUnselectedProperties()
//        }
        
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setSelectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setUnselectedProperties()
        
        searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
            return algo1.bestCase.1 < algo2.bestCase.1
        })
        
        searchCollectionView.reloadData()
    }
    
    @IBAction func averageFilterActionButton(_ sender: SearchFilterButton) {
//        if averageFilterButton.state == .selected {
//            averageFilterButton.setSelectedProperties()
//        }
//        else {
//            averageFilterButton.setUnselectedProperties()
//        }
        
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setSelectedProperties()
        worstFilterButton.setUnselectedProperties()
        
        searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
            return algo1.averageCase.1 < algo2.averageCase.1
        })
        
        searchCollectionView.reloadData()
    }
    
    @IBAction func worstFilterActionButton(_ sender: SearchFilterButton) {
//        if worstFilterButton.state == .selected {
//            worstFilterButton.setSelectedProperties()
//        }
//        else {
//            worstFilterButton.setUnselectedProperties()
//        }
        
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setSelectedProperties()
        
        searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
            return algo1.worstCase.1 < algo2.worstCase.1
        })
        
        searchCollectionView.reloadData()
    }
    
    
    private var searchedAlgorithms: [Algorithm] = Array()
    var isFiltering: Bool = false
    
    private let algorithmCollection : [Algorithm] = [
        Algorithm(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Shell Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Merge Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Quick Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Cube Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Binary Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
        Algorithm(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n²)", 10), averageCase: ("O(n²)", 10), worstCase: ("O(n²)", 10), memory: "O(n²)"),
    ]
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var algorithmViewController = segue.destination as! AlgorithmViewController
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        searchTextField.delegate = self
        
        searchTextField.attributedPlaceholder = NSAttributedString(string:"Search for an algorithm", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Roboto", size: 14)!])
        
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
        let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let currentAlgo = searchedAlgorithms[indexPath.item]
        currentCell.setSearchButtonLabels(cellData: currentAlgo)
        currentCell.backgroundColor = #colorLiteral(red: 0, green: 0.4352941176, blue: 1, alpha: 1)
        
        return currentCell
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedAlgorithms.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentAlgorithm = searchedAlgorithms[indexPath.row]
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








