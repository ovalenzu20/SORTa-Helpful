//
//  InfoViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/11/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController{
    
    @IBOutlet weak var algorithmTableView: UITableView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        algorithmTableView.delegate = self
        algorithmTableView.dataSource = self
        algorithmTableView.estimatedRowHeight = 3000
        algorithmTableView.rowHeight = UITableViewAutomaticDimension
        self.algorithmTableView.rowHeight = CGFloat(3000/algorithmCollection.count)
        
    }


}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithmCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentAlgorithm = algorithmCollection[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "algorithmCell") as! AlgorithmTableCell
        
        cell.setAlgorithmLabels(cellData: currentAlgorithm)
        return cell
        }
    
    
//this is for creating a new view when you click on one of the rows
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        let currentAlgorithm = algorithmCollection[indexPath.row]
//
//        let algorithmVC = storyboard?.instantiateViewController(withIdentifier: "AlgorithmViewController") as? AlgorithmViewController
//
//        algorithmVC?.algorithm = currentAlgorithm
//
//        self.navigationController?.pushViewController(algorithmVC!, animated: true)
//
//    }
    
    
    
}



