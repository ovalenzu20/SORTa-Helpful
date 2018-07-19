//
//  QuizTableViewCell.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//


import UIKit

@IBDesignable class QuizTableViewCell: UITableViewCell {

    var quiz : Quiz?
    
    @IBOutlet weak var questionName: UILabel!
    
    @IBAction func answer1(_ sender: Any) {
        
    }
    
    @IBAction func answer2(_ sender: Any) {
    }
    
    @IBAction func answer3(_ sender: Any) {
    }
    
    @IBAction func answer4(_ sender: Any) {
    }
    
    @IBOutlet var possibleAnswers: [UIButton]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    
    func setQuestionButtonLabels(quiz: Quiz, questionNumber: Int)
    {
        var answerIndex = 0
        questionName.text! = quiz.questions[questionNumber].question
//        print(quiz.questions[questionNumber].question)
//        print(questionNumber)
        for posAnswer in quiz.questions[questionNumber].possibleAnswers{
            possibleAnswers[answerIndex].setTitle(posAnswer, for: UIControlState.normal)
            answerIndex += 1
        }
    }
    
    
}
