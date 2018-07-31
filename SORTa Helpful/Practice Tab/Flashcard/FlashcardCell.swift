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
        self.addSubview(algorithmNameLabel)
    }
    
    
    func setupInfoView() {
        
    }
    
    
    func flipCard() {
        if isFlipped {
            
        }
        else {
            
        }
    }
    
    
    
}
