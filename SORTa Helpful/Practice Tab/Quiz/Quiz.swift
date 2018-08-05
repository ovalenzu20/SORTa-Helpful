//
//  Question.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import GameplayKit

class Question {
    var belongsToQuiz : String
    var question : String
    var possibleAnswers: [String]
    var correctAnswer: String
    var incorrectAnswer = -1
    var isAnswered = false
    var inputAnswer : Int?
    
    
    init (question : String, possibleAnswers: [String], correctAnswer: String, belongsToQuiz: String)
    {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.belongsToQuiz = belongsToQuiz
        self.correctAnswer = correctAnswer
    }
    
    
}

class Quiz {
    var questions = [Question]()
    var quizName : String
    var quizDescription : String?
    var numberOfQuestions = 0
    var numberOfQuestionsAnswered = 0
    var numberOfQuestionsAnsweredCorrectly = 0
    var numberOfQuestionsAnsweredIncorrectly = 0
    
    init (quizName: String)
    {
        self.quizName = quizName
    }
    
    func addQuestion(question: Question){
        questions.append(question)
        numberOfQuestions += 1
    }
    
    func addMultipleQuestions(questionsToAdd: [Question]){
        for q in questionsToAdd{
            addQuestion(question: q)
        }
    }
}



