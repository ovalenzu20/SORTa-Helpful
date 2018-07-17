//
//  SearchViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/1/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchViewController: UIViewController {
    private let algorithmDataFile : String = "SupportingFiles/algorithmInfo.json"
    private var algorithmCollection : [Algorithm] = Array()
    private var searchedAlgorithms  : [Algorithm] = Array()
    
    var sortedByName:    Bool = false
    var sortedByBest:    Bool = false
    var sortedByAverage: Bool = false
    var sortedByWorst:   Bool = false
    
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField:      SearchTextField!
    @IBOutlet weak var nameFilterButton:     SearchFilterButton!
    @IBOutlet weak var bestFilterButton:     SearchFilterButton!
    @IBOutlet weak var averageFilterButton:  SearchFilterButton!
    @IBOutlet weak var worstFilterButton:    SearchFilterButton!
    
    
    @IBAction func nameFilterActionButton(_ sender: SearchFilterButton) {
        if nameFilterButton.buttonIsSelected() {
            setSortedLabelsOff()
            nameFilterButton.isSelected = false
            setAllUnselectedProperties()
            searchedAlgorithms.removeAll()
            reloadOriginalData()
        }
        else {
            sortByName()
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.name < algo2.name
            })
            searchCollectionView.reloadData()
        }
    }
    
    
    @IBAction func bestFilterActionButton(_ sender: SearchFilterButton) {
        if bestFilterButton.buttonIsSelected() {
            setSortedLabelsOff()
            bestFilterButton.isSelected = false
            setAllUnselectedProperties()
            reloadOriginalData()
        }
        else {
            sortByBest()
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.bestCase.1 < algo2.bestCase.1
            })
            searchCollectionView.reloadData()
        }
    }
    
    
    @IBAction func averageFilterActionButton(_ sender: SearchFilterButton) {
        if averageFilterButton.buttonIsSelected() {
            setSortedLabelsOff()
            averageFilterButton.isSelected = false
            setAllUnselectedProperties()
            reloadOriginalData()
        }
        else {
            sortByAverage()
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.averageCase.1 < algo2.averageCase.1
            })
            searchCollectionView.reloadData()
        }
    }
    
    
    @IBAction func worstFilterActionButton(_ sender: SearchFilterButton) {
        if worstFilterButton.buttonIsSelected() {
            setSortedLabelsOff()
            worstFilterButton.isSelected = false
            setAllUnselectedProperties()
            reloadOriginalData()
        }
        else {
            sortByWorst()
            searchedAlgorithms.sort(by: {(algo1: Algorithm, algo2: Algorithm) -> Bool in
                return algo1.worstCase.1 > algo2.worstCase.1
            })
            searchCollectionView.reloadData()
        }
    }
    
    
    func readAlgorithmJsonData() {
        if let path = Bundle.main.path(forResource: "algorithmInfo", ofType: "json") {
            do {
                let data    = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                
                let algoDict = jsonObj.dictionaryValue
                
                for (algorithmName, algorithmData) in algoDict {
                    
                    let algoClass        = algorithmData["algoClass"].stringValue
                    let algoType         = algorithmData["algoType"].stringValue
                    let bestCaseArray    = algorithmData["bestCase"].arrayValue
                    let bestCase         = (bestCaseArray[0].stringValue, bestCaseArray[1].intValue)
                    let averageCaseArray = algorithmData["averageCase"].arrayValue
                    let averageCase      = (averageCaseArray[0].stringValue, averageCaseArray[1].intValue)
                    let worstCaseArray   = algorithmData["worstCase"].arrayValue
                    let worstCase        = (worstCaseArray[0].stringValue, worstCaseArray[1].intValue)
                    let memory           = algorithmData["memory"].stringValue
                    let info             = algorithmData["info"].stringValue
                    
//                    print(info)
                    
                    algorithmCollection.append(Algorithm(name: algorithmName, algoClass: algoClass, algoType: algoType, bestCase: bestCase, averageCase: averageCase, worstCase: worstCase, memory: memory, info: info))
                }
                
            } catch let error {
                // In the future add function that displays empty cells and prompts user to reload page
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            // In the future add function that displays empty cells and prompts user to reload page
            print("Invalid filename/path.")
        }
    }
    
    
    func setSortedLabelsOff() {
        sortedByName    = false
        sortedByBest    = false
        sortedByAverage = false
        sortedByWorst   = false
    }
    
    func setAllUnselectedProperties() {
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setUnselectedProperties()
    }
    
    func sortByName() {
        sortedByName    = true
        sortedByBest    = false
        sortedByAverage = false
        sortedByWorst   = false
        nameFilterButton.setSelectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setUnselectedProperties()
    }
    
    func sortByBest() {
        sortedByName    = false
        sortedByBest    = true
        sortedByAverage = false
        sortedByWorst   = false
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setSelectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setUnselectedProperties()
    }
    
    func sortByAverage() {
        sortedByName    = false
        sortedByBest    = false
        sortedByAverage = true
        sortedByWorst   = false
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setSelectedProperties()
        worstFilterButton.setUnselectedProperties()
    }
    
    func sortByWorst() {
        sortedByName    = false
        sortedByBest    = false
        sortedByAverage = false
        sortedByWorst   = true
        nameFilterButton.setUnselectedProperties()
        bestFilterButton.setUnselectedProperties()
        averageFilterButton.setUnselectedProperties()
        worstFilterButton.setSelectedProperties()
    }
    
    func reloadOriginalData() {
        searchedAlgorithms.removeAll()
        
        for algo in algorithmCollection {
            searchedAlgorithms.append(algo)
        }
        searchCollectionView.reloadData()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var algorithmViewController = segue.destination as! AlgorithmViewController
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlgorithmJsonData()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        searchTextField.attributedPlaceholder = NSAttributedString(string:"Search for an algorithm", attributes: [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Roboto", size: 14)!])
        
        searchCollectionView.delegate   = self
        searchCollectionView.dataSource = self
        searchTextField.delegate        = self
        
        let collectionWidth = (view.frame.size.width - 60) / 2
        let layout = searchCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionWidth, height: 100.0)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        for algo in algorithmCollection {
            searchedAlgorithms.append(algo)
        }
        
        print(algorithmCollection)
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
        
        //searchCell.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
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
        textField.resignFirstResponder()
        return true
    }
}









