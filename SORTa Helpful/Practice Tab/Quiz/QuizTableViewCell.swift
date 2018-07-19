//
//  QuizTableViewCell.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//


import UIKit

@IBDesignable class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet var possibleAnswers: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        question.text = "what is merge sort's runtime"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //TODO: set table labels according to the quizzes obtained
    func setTableLabels(inputQuestion: String, inputPossibleAnswers: [String])
    {
        question.text! = inputQuestion
        for ans in stride(from: 0, to: inputPossibleAnswers.count, by: 1){
            possibleAnswers[ans].text! = inputPossibleAnswers[ans]
        }
    }
}
