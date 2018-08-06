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
    var fcType: String!
    var flashcardCollectionView : UICollectionView!
    var categoryCollection      : [Algorithm]!
    var randomCollection        : [(String, String)]!
    
    private var cellsPerScreen  : CGFloat = 1
    private var cellHeight      : CGFloat = 200.0
    private var widthConstraint : CGFloat = 20
    
    
    func refreshCellView() {
        let collectionWidth = (view.frame.size.width - widthConstraint) / cellsPerScreen
        let layout = flashcardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionWidth, height: cellHeight)
    }
    
    
    private func setupFlashcardCollectionView() {
        
    }
    
    
    fileprivate func createRandomFlashcardCollection() {
        self.randomCollection = []
        
        for algorithm in self.categoryCollection {
            self.randomCollection.append(self.chooseRandomProperty(algorithmInfo: algorithm))
        }
    }
    
    
    fileprivate func chooseRandomProperty(algorithmInfo: Algorithm) -> (String, String) {
        let properties = ["best case", "average case", "worst case", "memory", "type"]
        let randomPropIndex = Int(arc4random_uniform(UInt32(properties.count - 1)))
        let randomProp = properties[randomPropIndex]
        
        switch randomProp {
        case "best case":
            return (algorithmInfo.name, algorithmInfo.bestCase.0)
        case "average case":
            return (algorithmInfo.name, algorithmInfo.averageCase.0)
        case "worst case":
            return (algorithmInfo.name, algorithmInfo.worstCase.0)
        case "memory":
            return (algorithmInfo.name, algorithmInfo.memory)
        case "type":
            return (algorithmInfo.name, algorithmInfo.algoType)
        default:
            return (algorithmInfo.name, algorithmInfo.bestCase.0)
        }
    }
    
    
    fileprivate func getFlachcardLabels(algorithmInfo: Algorithm) -> (String, String) {
        switch self.fcType {
        case "best case":
            return (algorithmInfo.name, algorithmInfo.bestCase.0)
        case "average case":
            return (algorithmInfo.name, algorithmInfo.averageCase.0)
        case "worst case":
            return (algorithmInfo.name, algorithmInfo.worstCase.0)
        case "memory":
            return (algorithmInfo.name, algorithmInfo.memory)
        case "type":
            return (algorithmInfo.name, algorithmInfo.algoType)
        default:
            return (algorithmInfo.name, algorithmInfo.bestCase.0)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFlashcardCollectionView()
        
        if self.fcType == "random" {
            self.createRandomFlashcardCollection()
        }
        
        flashcardCollectionView.delegate   = self
        flashcardCollectionView.dataSource = self
        
        self.refreshCellView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension FlashcardChosenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flashcard = collectionView.dequeueReusableCell(withReuseIdentifier: "FlashcardCell", for: indexPath) as! FlashcardCell
        flashcard.flipCard()
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let flashcardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlashcardCell", for: indexPath) as! FlashcardCell
        
        var algoInfo: (String, String)!
        
        if fcType == "random" {
            algoInfo = randomCollection[indexPath.item]
            
        }
        else {
            algoInfo = self.getFlachcardLabels(algorithmInfo: categoryCollection[indexPath.item])
        }
        
        flashcardCell.setupLabelText(name: algoInfo.0, info: algoInfo.1)
        
        return flashcardCell
    }
}






















