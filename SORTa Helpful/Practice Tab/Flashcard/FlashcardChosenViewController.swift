//
//  FlashcardChosenViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON


class FlashcardChosenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var fcType: String!
    var flashcardCollectionView : UICollectionView!
    var categoryCollection      : [Algorithm]!
    var randomCollection        : [(String, String)]!
    
    
//    var fcProgressView : UIProgressView = {
//        var progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
//        progressView.progress = 0.0
//        progressView.layer.cornerRadius = 8
//        progressView.clipsToBounds = true
//        progressView.progressTintColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1)
//        progressView.trackTintColor    = #colorLiteral(red: 0.1676258147, green: 0.1638127565, blue: 0.2031261921, alpha: 1)
//        return progressView
//    }()
//
//
//    var fcProgressLabel : UILabel = {
//        let label = UILabel()
//        label.text = "1 / 13"
//        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        label.numberOfLines = 1
//        label.textAlignment = .center
//        label.font = UIFont(name: "Roboto-Light", size: 14)
//        return label
//    }()
    
    
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
        
        flashcardCell.setupLabelText(name: algoInfo.0, info: algoInfo.1, fcType: fcType)
        flashcardCell.setCardTextToName()
        
        return flashcardCell
    }
    
    
    private func setupViews() {
        self.title = "\(fcType!.uppercased()) FLASHCARDS"
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        flashcardCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        
        flashcardCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        flashcardCollectionView.isPagingEnabled = true
        flashcardCollectionView.showsHorizontalScrollIndicator = false
        flashcardCollectionView.register(FlashcardCell.self, forCellWithReuseIdentifier: "FlashcardCell")
        flashcardCollectionView.delegate   = self
        flashcardCollectionView.dataSource = self
        
        self.view.addSubview(flashcardCollectionView)
//        self.view.addSubview(fcProgressView)
//        self.view.addSubview(fcProgressLabel)
        
        flashcardCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        fcProgressView.translatesAutoresizingMaskIntoConstraints          = false
//        fcProgressLabel.translatesAutoresizingMaskIntoConstraints         = false

        flashcardCollectionView.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor).isActive  = true
        flashcardCollectionView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor).isActive  = true
        flashcardCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        flashcardCollectionView.heightAnchor.constraint(equalToConstant: 340).isActive                = true
        
//        fcProgressView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor,              constant:  40).isActive = true
//        fcProgressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,             constant: -40).isActive = true
//        fcProgressView.topAnchor.constraint(equalTo:      flashcardCollectionView.bottomAnchor, constant:  20).isActive = true
//        fcProgressView.heightAnchor.constraint(equalToConstant: 16).isActive                                            = true
//
//        fcProgressLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        fcProgressLabel.bottomAnchor.constraint(equalTo:  flashcardCollectionView.topAnchor, constant: -20).isActive = true
//        fcProgressLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
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
        self.setupViews()
        
        if self.fcType == "random" {
            self.createRandomFlashcardCollection()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



















