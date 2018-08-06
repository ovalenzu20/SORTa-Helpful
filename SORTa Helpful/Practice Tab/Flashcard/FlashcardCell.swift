//
//  FlashcardCell.swift
//  SORTa Helpful
//
//  Created by Teran on 7/31/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit


class FlashcardCell: UICollectionViewCell {
    var isFlipped = false
    var nameText: String!
    var infoText: String!
    
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    func setupLabelText(name: String, info: String) {
        self.nameText = name
        self.infoText = info
    }
    
    
    func flipCard() {
        if isFlipped {
            isFlipped = false
            infoLabel.text = self.nameText
            self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else {
            isFlipped = true
            infoLabel.text = self.infoText
            self.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1215686275, blue: 0.1450980392, alpha: 1)
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
}
