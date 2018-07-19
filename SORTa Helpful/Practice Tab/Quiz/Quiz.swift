//
//  Question.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation

enum questionOutOfBoundsError : Error {
    case runtimeError(String)
}


class Question {
    var question : String
    var possibleAnswers: [String]
    var correctAnswer: String
    
    init (question : String, possibleAnswers: [String], correctAnswer: String)
    {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.correctAnswer = correctAnswer
    }
}

class Quiz {
    private var questions = [Question]()
    
    private var quizName : String
    private var numberOfQuestions = 0
    private var numberOfQuestionsAnswered = 0
    private var numberOfQuestionsAnsweredCorrectly = 0
    private var numberOfQuestionsAnsweredIncorrectly = 0
    
    init (quizName: String)
    {
        self.quizName = quizName
    }
    
    func addQuestion(question: Question){
        questions.append(question)
        numberOfQuestions += 1
    }
    
    func answerQuestion(questionNumberToAnswer: Int, answer: String) throws -> Bool {
        if questionNumberToAnswer < numberOfQuestions{
            if questions[questionNumberToAnswer].correctAnswer == answer {
                numberOfQuestionsAnswered += 1
                numberOfQuestionsAnsweredCorrectly += 1
                return true
            }
            
            else {
                numberOfQuestionsAnswered += 1
                numberOfQuestionsAnsweredIncorrectly += 1
                return false
            }
        }
        //if questionNumberToAnswer > numberOfQuestions, throw exception
        throw questionOutOfBoundsError.runtimeError("questionNumberToAnswer > numberOfQuestions")
    }
    
    //calculateScore() is called when the user clicks "Calculate Score"
    func calculateScore() -> Double
    {
        
        let quizScore = Double(numberOfQuestionsAnsweredCorrectly) / Double(numberOfQuestionsAnswered)
        let quizScoreRounded = round(quizScore, toDecimalPlaces: 2)
        return quizScoreRounded
    }
    
    func round(_ value: Double, toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(value * divisor) / divisor
    }
    
    
}



