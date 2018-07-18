//
//  InfoViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/11/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var algorithmTableView: UITableView!

    private var algorithmCollection : [Algorithm] = []
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algorithmCollection.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentAlgorithm = algorithmCollection[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "algorithmCell") as! AlgorithmTableCell
        cell.setAlgorithmLabels(cellData: currentAlgorithm)
        return cell 
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        algorithmTableView.delegate = self
        algorithmTableView.dataSource = self
        readAlgorithmJsonData()
        algorithmTableView.rowHeight = 210
    }

}
