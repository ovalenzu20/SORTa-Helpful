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
    
    var algorithmNameLabel: UILabel = {
        let label = UILabel()
        label.textColor     = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var algorithmInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor     = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupNameView() {
        self.addSubview(self.algorithmNameLabel)
    }
    
    
    func setupInfoView() {
        self.addSubview(self.algorithmInfoLabel)
    }
    
    
    func flipCard() {
        if isFlipped {
            isFlipped = false
            self.willRemoveSubview(self.algorithmInfoLabel)
            self.setupInfoView()
            self.backgroundColor = #colorLiteral(red: 0.3279073238, green: 0.53362149, blue: 1, alpha: 1)
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else {
            isFlipped = true
            self.willRemoveSubview(self.algorithmNameLabel)
            self.setupNameView()
            self.backgroundColor = #colorLiteral(red: 0.3279073238, green: 0.53362149, blue: 1, alpha: 1)
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
}
