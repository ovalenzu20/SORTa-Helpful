//
//  flashcardViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/15/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON


class FlashcardViewController: UIViewController {
    var algorithmCollection: [(Algorithm, Int)]!
    
    
    @IBAction func bestCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "best case")
    }
    
    @IBAction func averageCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "average case")
    }
    
    @IBAction func worstCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "worst case")
    }
    
    @IBAction func typeCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "type")
    }
    
    @IBAction func memoryCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "memory")
    }
    
    @IBAction func randomMixCaseFlachcards(_ sender: UIButton) {
        self.segueWithFlashcardType(fcType: "random")
    }
    
    
    private func segueWithFlashcardType(fcType: String) {
        let flashcardChosenVC = storyboard?.instantiateViewController(withIdentifier: "FlashcardChosenViewController") as? FlashcardChosenViewController
        flashcardChosenVC?.categoryCollection = self.algorithmCollection
        flashcardChosenVC?.fcType = fcType
        self.navigationController?.pushViewController(flashcardChosenVC!, animated: true)
    }
    
    
    func readAlgorithmJsonData() {
        algorithmCollection = []
        
        if let path = Bundle.main.path(forResource: "algorithmInfo", ofType: "json") {
            do {
                let data     = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj  = try JSON(data: data)
                let algoDict = jsonObj.dictionaryValue
                var index = 0
                
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
                    
                    algorithmCollection.append((Algorithm(name: algorithmName, algoClass: algoClass, algoType: algoType, bestCase: bestCase, averageCase: averageCase, worstCase: worstCase, memory: memory, info: info), index))
                    
                    index += 1
                }
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        }
        else {
            print("Invalid filename/path.")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readAlgorithmJsonData()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
