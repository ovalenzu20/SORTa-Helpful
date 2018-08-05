//
//  FlashcardCell.swift
//  SORTa Helpful
//
//  Created by Teran on 7/31/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit


class FlashcardCell: UICollectionViewCell {
    var algorithmNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    var algorithmInfoLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    func setupNameView() {
        self.addSubview(algorithmNameLabel)
    }
    
    
    func setupInfoView() {
        
    }
    
    
    func flipCard() {
        
    }
    
    
    
}
