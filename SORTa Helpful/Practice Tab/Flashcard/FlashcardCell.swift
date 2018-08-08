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
    var nameText : String!
    var infoText : String!
    
    var flashcardButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1607843137, blue: 0.2078431373, alpha: 1)
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    var infoLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.numberOfLines = 6
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Roboto-Bold", size: 20)
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.flashcardButton.addTarget(self, action: #selector(self.flipCard(sender:)), for: .touchUpInside)
        self.setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func setupSubviewConstraints() {
        
    }
    
    
    func setupViews() {
        // Add flashcard button to view
        self.addSubview(flashcardButton)
      
        
        flashcardButton.translatesAutoresizingMaskIntoConstraints = false
        flashcardButton.heightAnchor.constraint(equalToConstant: 240).isActive = true
        flashcardButton.leadingAnchor.constraint(equalTo:  self.contentView.leadingAnchor,  constant: 20).isActive  = true
        flashcardButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        flashcardButton.centerYAnchor.constraint(equalTo:  self.contentView.centerYAnchor).isActive = true
        
        
        // Add info label to flashcard button view
        flashcardButton.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerYAnchor.constraint(equalTo:  flashcardButton.centerYAnchor).isActive                 = true
        infoLabel.leadingAnchor.constraint(equalTo:  flashcardButton.leadingAnchor,  constant: 10).isActive  = true
        infoLabel.trailingAnchor.constraint(equalTo: flashcardButton.trailingAnchor, constant: -10).isActive = true
    }
    
    
    func setupLabelText(name: String, info: String) {
        self.nameText = name.uppercased()
        self.infoText = info
    }
    
    
    func setCardTextToName() {
        self.infoLabel.text = self.nameText
    }
    
    
    func setCardTextToInfo() {
        self.infoLabel.text = self.infoText
    }
    
    
    @objc func flipCard(sender: UIButton) {
        if self.isFlipped {
            self.isFlipped = false
            self.infoLabel.text = self.nameText
            self.flashcardButton.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1607843137, blue: 0.2078431373, alpha: 1)
            UIView.transition(with: self.flashcardButton, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else {
            self.isFlipped = true
            self.infoLabel.text = self.infoText
            self.flashcardButton.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1607843137, blue: 0.2078431373, alpha: 1)
            UIView.transition(with: self.flashcardButton, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
}
