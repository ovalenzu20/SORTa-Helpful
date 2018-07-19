//
//  Question.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation
import GameplayKit

enum questionOutOfBoundsError : Error {
    case runtimeError(String)
}


class Question {
    var question : String
    var possibleAnswers: [String]
    var correctAnswer: String
    
    var allPossibleAlgorithms = ["Bubble Sort", "Insertion Sort", "Selection Sort", "Spread Sort", "Radix Sort", "Cube Sort", "Pigeonhole Sort", "Merge Sort", "Quick Sort", "Cocktail Sort", "Block Sort", "Heap Sort", "Bucket Sort", "Counting Sort"]
    
    init (question : String, possibleAnswers: [String], correctAnswer: String)
    {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.correctAnswer = correctAnswer
        
        self.possibleAnswers = randomizeAnswers(answersToRandomize: possibleAnswers, allAlgorithms: allPossibleAlgorithms)
    }
    
    func randomizeAnswers(answersToRandomize: [String], allAlgorithms: [String]) -> [String]
    {
        var randomPossibleAnswers = [String]()
        var allAlgorithmsShuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allAlgorithms) as! [String]
        
        for elem in 0..<answersToRandomize.count{
            if elem == 0 {
                randomPossibleAnswers.append(answersToRandomize[0])
            }
            else if elem > 0 {
                let lastElem = allAlgorithmsShuffled.removeLast()
                randomPossibleAnswers.append(lastElem)
            }
        }
        //shuffle final result
        let shuffledRandomPossibleAnswers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: randomPossibleAnswers) as! [String]
        
        return shuffledRandomPossibleAnswers
    }
    
}

class Quiz {
    var questions = [Question]()
    
    var quizName : String
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



