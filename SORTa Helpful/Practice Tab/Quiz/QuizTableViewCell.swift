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
    
    func deselectAllOtherAnswers(currentAnswer: Int){
        for ans in 0..<possibleAnswers.count{
            if ans != currentAnswer{
                possibleAnswers[ans].isSelected = false
                possibleAnswers[ans].backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
            }
        }
    }
    
    func unselectCurrentAnswer(answer: Int, question: Question){
        possibleAnswers[answer].isSelected = false
        possibleAnswers[answer].backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        question.inputAnswer = -1
        
    }
    
    func otherAnswerIsSelected(currentAnswer: Int, question: Question) -> Bool{
        
        for ans in 0..<possibleAnswers.count{
            if ans != currentAnswer && possibleAnswers[ans].isSelected{
                return true
            }
        }
        return false
    }
    
    func markCurrentAnswerAsSelected(currentAnswer: Int, question: Question){
        
        if possibleAnswers[currentAnswer].isSelected == false{
            possibleAnswers[currentAnswer].isSelected = true
            possibleAnswers[currentAnswer].backgroundColor = #colorLiteral(red: 0.262745098, green: 0.4352941176, blue: 1, alpha: 1)
            question.inputAnswer = currentAnswer
        }
    }
    
    @IBAction func answer1(_ sender: Any) {
        let currentAnswer = 0
        let currentQuestion = currentQuiz!.questions[currentQuestionNumber]
        
        if possibleAnswers[currentAnswer].isSelected {
            unselectCurrentAnswer(answer: currentAnswer, question: currentQuestion)
        }
        
        else if otherAnswerIsSelected(currentAnswer: currentAnswer, question: currentQuestion) {
            deselectAllOtherAnswers(currentAnswer: currentAnswer)
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
        
        else {
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
        
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer
    }
    
    @IBAction func answer2(_ sender: Any) {
        let currentAnswer = 1
        let currentQuestion = currentQuiz!.questions[currentQuestionNumber]
        
        if possibleAnswers[currentAnswer].isSelected {
            unselectCurrentAnswer(answer: currentAnswer, question: currentQuestion)
        }
            
        else if otherAnswerIsSelected(currentAnswer: currentAnswer, question: currentQuestion) {
            deselectAllOtherAnswers(currentAnswer: currentAnswer)
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
            
        else {
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
        
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer

    }
    
    @IBAction func answer3(_ sender: Any) {
        let currentAnswer = 2
        let currentQuestion = currentQuiz!.questions[currentQuestionNumber]
        
        if possibleAnswers[currentAnswer].isSelected {
            unselectCurrentAnswer(answer: currentAnswer, question: currentQuestion)
        }
            
        else if otherAnswerIsSelected(currentAnswer: currentAnswer, question: currentQuestion) {
            deselectAllOtherAnswers(currentAnswer: currentAnswer)
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
            
        else {
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
        
        currentQuiz!.questions[currentQuestionNumber].inputAnswer = currentAnswer

    }
    
    @IBAction func answer4(_ sender: Any) {
        let currentAnswer = 3
        let currentQuestion = currentQuiz!.questions[currentQuestionNumber]
        
        if possibleAnswers[currentAnswer].isSelected {
            unselectCurrentAnswer(answer: currentAnswer, question: currentQuestion)
        }
            
        else if otherAnswerIsSelected(currentAnswer: currentAnswer, question: currentQuestion) {
            deselectAllOtherAnswers(currentAnswer: currentAnswer)
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
            
        else {
            markCurrentAnswerAsSelected(currentAnswer: currentAnswer, question: currentQuestion)
        }
        
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


