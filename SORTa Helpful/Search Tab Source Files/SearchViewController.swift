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
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        
        searchTextField.attributedPlaceholder = NSAttributedString(string:"Search for an algorithm", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Roboto", size: 14)!])
        
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








