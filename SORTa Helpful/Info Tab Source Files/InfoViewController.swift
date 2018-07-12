//
//  InfoViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/11/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var algorithmTableView: UITableView!

    private let algorithmCollection : [Algorithm] = [
        Algorithm(name: "Bubble Sort",     algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Selection Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n²)", 10),     averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Insertion Sort",  algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(n²)"),
        Algorithm(name: "Heap Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlog(n))", 6), worstCase: ("O(nlog(n))", 6),    memory: "O(1)"),
        Algorithm(name: "Cocktail Sort",   algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n²)", 10),     worstCase: ("O(n²)", 10),        memory: "O(1)"),
        Algorithm(name: "Block Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlog(n))", 6), worstCase: ("O(nlog(n))", 6),    memory: "O(1)"),
        Algorithm(name: "Merge Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlog(n))", 6), averageCase: ("O(nlog(n))", 6), worstCase: ("O(nlog(n))", 6),    memory: "O(n)"),
        Algorithm(name: "Quick Sort",      algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(nlog(n))", 6), averageCase: ("O(nlog(n))", 6), worstCase: ("O(n²)", 10),        memory: "O(log(n))"),
        Algorithm(name: "Cube Sort",       algoClass: "Comparison",     algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(nlog(n))", 6), worstCase: ("O(nlog(n))", 6),    memory: "O(n)"),
        Algorithm(name: "Counting Sort",   algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+r)", 2),     worstCase: ("O(n+r)", 2),        memory: "O(n+r)"),
        Algorithm(name: "Radix Sort",      algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n(k/d))", 3),  worstCase: ("O(n(k/d))", 3),     memory: "O(n+2ᵈ)"),
        Algorithm(name: "Spread Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n(k/d))", 3),  worstCase: ("O(n((k/s)+d))", 4), memory: "O(n+2ᵈ)"),
        Algorithm(name: "Bucket Sort",     algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+r)", 2),     worstCase: ("O(n+r)", 2),        memory: "O(n+r)"),
        Algorithm(name: "Pigeonhole Sort", algoClass: "Non-comparison", algoType: "In-place", bestCase: ("O(n)", 1),       averageCase: ("O(n+2ᵏ)", 5),    worstCase: ("O(n+2ᵏ)", 5),       memory: "O(2ᵏ)"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithmCollection.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentAlgorithm = algorithmCollection[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "algorithmCell")!
        
//        let text = currentAlgorithm.name
//        cell.textLabel?.text = text
        
//        let algorithmVC = storyboard?.instantiateViewController(withIdentifier: "AlgorithmViewController") as? AlgorithmViewController
//
//        algorithmVC?.algorithm = currentAlgorithm
//
//        self.navigationController?.pushViewController(algorithmVC!, animated: true)

        return cell 
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        algorithmTableView.delegate = self
        algorithmTableView.dataSource = self
        algorithmTableView.estimatedRowHeight = 2000
        algorithmTableView.rowHeight = UITableViewAutomaticDimension
        self.algorithmTableView.rowHeight = CGFloat(2000/algorithmCollection.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
