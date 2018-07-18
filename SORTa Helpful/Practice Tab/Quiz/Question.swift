//
//  Question.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation

class Question : Quiz {
    var question : String
    var possibleAnswers: [String]
    var correctAnswer: String
    
    init (question: String, possibleAnswers: [String], correctAnswer: String) {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.correctAnswer = correctAnswer
    }
    
}
