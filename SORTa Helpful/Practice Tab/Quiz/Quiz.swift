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
    var belongsToQuiz : String
    var question : String
    var possibleAnswers: [String]
    var correctAnswer: Int
    var incorrectAnswer = -1
    var isAnswered : Bool?
    var inputAnswer : Int?
    
    
    
    var allPossibleAlgorithms = ["Bubble Sort", "Insertion Sort", "Selection Sort", "Spread Sort", "Radix Sort", "Cube Sort", "Pigeonhole Sort", "Merge Sort", "Quick Sort", "Cocktail Sort", "Block Sort", "Heap Sort", "Bucket Sort", "Counting Sort"]
    
    init (question : String, possibleAnswers: [String], correctAnswer: String, belongsToQuiz: String)
    {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.belongsToQuiz = belongsToQuiz
        self.correctAnswer = possibleAnswers.index(of: correctAnswer)!
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
    
//    func calculateAnswerStatistics(){
//        for q in questions{
//            if q.inputAnswer != -1{
//                if q.inputAnswer == q.correctAnswer{
//                    numberOfQuestionsAnsweredCorrectly += 1
//                    numberOfQuestionsAnswered += 1
//                }
//                else {
//                    numberOfQuestionsAnsweredIncorrectly += 1
//                    numberOfQuestionsAnswered += 1
//                }
//            }
//        }
//    }
//
//    func calculateScore() -> Double
//    {
//        self.calculateAnswerStatistics()
//        let quizScore = Double(numberOfQuestionsAnsweredCorrectly) / Double(numberOfQuestionsAnswered)
//        let quizScoreRounded = round(quizScore, toDecimalPlaces: 2)
//        return quizScoreRounded
//    }
    
    func round(_ value: Double, toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(value * divisor) / divisor
    }
    
}



