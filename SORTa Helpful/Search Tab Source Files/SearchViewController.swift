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
    
    
    
<<<<<<< HEAD
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
=======
    let algorithmCollection : [Algorithm] = [
        Algorithm(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Shell Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)"),
        Algorithm(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: "O(n²)", averageCase: "O(n²)", worstCase: "O(n²)", memory: "O(n²)")
>>>>>>> 93e2aabd32b8383962764616fa41c82e018ccfef
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var algorithmViewController = segue.destination as! AlgorithmViewController
    }
    
    
    
    let algorithmFilePath: String = "SupportingFiles/algorithmInfo.json"
    
    
//    func loadJSON(filename fileName: String) -> [Algorithm]? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(ResponseData.self, from: data)
//                return jsonData.person
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.attributedPlaceholder = NSAttributedString(string:"Search for an algorithm", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Roboto", size: 14)!])
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        
        let collectionWidth = (view.frame.size.width - 60) / 2
        let layout = searchCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionWidth, height: 100.0)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = algorithmCollection[indexPath.item]
        let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell

        searchCell.setSearchButtonLabels(cellData: cellData)
        
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
        return algorithmCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentAlgorithm = algorithmCollection[indexPath.row]
        
        let algorithmVC = storyboard?.instantiateViewController(withIdentifier: "AlgorithmViewController") as? AlgorithmViewController
        
        algorithmVC?.algorithm = currentAlgorithm
        
        self.navigationController?.pushViewController(algorithmVC!, animated: true)
    }
}








