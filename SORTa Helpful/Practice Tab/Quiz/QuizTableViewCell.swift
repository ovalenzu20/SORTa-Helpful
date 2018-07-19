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
    
    func getPseudocodeFromFile(question: Question) -> String {
        let fileUrl = Bundle.main.path(forResource: question.question, ofType: "txt")
        print(question.question)
        var pseudoCodeString = ""
        
        do {
            pseudoCodeString = try String(contentsOfFile: fileUrl!, encoding: .utf8)
            pseudoCodeString.removeLast()
        } catch let error as NSError {
            print(error.localizedDescription)
            return "Error loading pseudocode"
        }
        
        return pseudoCodeString
    }
    
    func setQuestionButtonLabels(quiz: Quiz, questionNumber: Int)
    {
        var answerIndex = 0
        let currentQuestion = quiz.questions[questionNumber]
        questionName.text! = currentQuestion.question
        if quiz.quizName == "IDENTIFY ALGORITHMS"{
            let psuedocode = getPseudocodeFromFile(question: currentQuestion)
            questionName.numberOfLines = 100
            questionName.text! = psuedocode
            questionName.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0, alpha: 1)
            questionName.font = questionName.font.withSize(12)
            questionName.textAlignment = NSTextAlignment.left
            
            questionName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
            
        }

        for posAnswer in currentQuestion.possibleAnswers{
            possibleAnswers[answerIndex].setTitle(posAnswer, for: UIControlState.normal)
            answerIndex += 1
        }
    }
}


