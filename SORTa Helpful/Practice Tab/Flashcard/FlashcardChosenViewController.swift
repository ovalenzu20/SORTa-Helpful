//
//  FlashcardChosenViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON


class FlashcardChosenViewController: UIViewController {
    var flashcardCollectionView: UICollectionView!
    var algorithmCollection: [Algorithm]!
    
    
    func readAlgorithmJsonData() {
        if let path = Bundle.main.path(forResource: "algorithmInfo", ofType: "json") {
            do {
                let data     = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj  = try JSON(data: data)
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
    
    
    private func setupFlashcardCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        self.flashcardCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flashcardCollectionView.delegate   = self
//        flashcardCollectionView.dataSource = self
        
        self.setupFlashcardCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension FlashcardChosenViewController: UICollectionViewDelegate {
    
}


//extension FlashcardChosenViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return algorithmCollection.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        re
//    }
//}






















