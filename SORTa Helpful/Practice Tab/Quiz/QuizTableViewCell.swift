//
//  QuizTableViewCell.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//


import UIKit

@IBDesignable class QuizTableViewCell: UITableViewCell {

    var currentQuiz : Quiz?
    var currentQuestionNumber = -1
    
    @IBOutlet weak var questionName: UILabel!
    private var timesButtonWasClicked = 0
    @IBOutlet var possibleAnswers: [UIButton]!
    
    @IBOutlet weak var answersStackView: UIStackView!
    
    
    
    func deselectAllOtherAnswers(currentAnswer: Int, answers: [UIButton]){
        for ans in 0..<answers.count{
            if ans != currentAnswer{
                //if already selected, mark unselected
                if answers[ans].isSelected == true {
                    answers[ans].isSelected = false
                    print("answer.selected = false")
                    answers[currentAnswer].backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
                    print("color is switched to black again")
                }
            }
        }
    }
    
    func markCurrentAnswerAsSelected(currentAnswer: Int, answers: [UIButton]){
        
        if answers[currentAnswer].isSelected == false{
            answers[currentAnswer].isSelected = true
//            answers[currentAnswer].backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            print("currently marking as selected")
        }
    }
    
    @IBAction func answer1(_ sender: Any) {
        let currentAnswer = 0
        deselectAllOtherAnswers(currentAnswer: currentAnswer, answers: possibleAnswers)
        markCurrentAnswerAsSelected(currentAnswer: currentAnswer, answers: possibleAnswers)
        
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer
    }
    
    @IBAction func answer2(_ sender: Any) {
        let currentAnswer = 1
        deselectAllOtherAnswers(currentAnswer: currentAnswer, answers: possibleAnswers)
        markCurrentAnswerAsSelected(currentAnswer: currentAnswer, answers: possibleAnswers)
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer

    }
    
    @IBAction func answer3(_ sender: Any) {
        let currentAnswer = 2
        deselectAllOtherAnswers(currentAnswer: currentAnswer, answers: possibleAnswers)
        markCurrentAnswerAsSelected(currentAnswer: currentAnswer, answers: possibleAnswers)
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer

    }
    
    @IBAction func answer4(_ sender: Any) {
        let currentAnswer = 3
        deselectAllOtherAnswers(currentAnswer: currentAnswer, answers: possibleAnswers)
        markCurrentAnswerAsSelected(currentAnswer: currentAnswer, answers: possibleAnswers)
        
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer

    }
    
   
    
   
    
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
        currentQuiz = quiz
        currentQuestionNumber = questionNumber
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


