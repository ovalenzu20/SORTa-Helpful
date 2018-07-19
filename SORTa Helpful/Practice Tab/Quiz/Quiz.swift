//
//  Question.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/18/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import Foundation

class Quiz : Test{
//    var questions : [String: [String]] //the first position is the correcet answer
    
    var numberOfQuestions : Int
    var numberOfQuestionsAnswered : Int
    var numberOfQuestionsAnsweredCorrectly : Int

    
    init (numberOfQuestions: Int, numberOfQuestionsAnswered : Int, numberOfQuestionsAnsweredCorrectly : Int, testName: String, testType: String)
    {
        self.numberOfQuestions = numberOfQuestions
        self.numberOfQuestionsAnswered = numberOfQuestionsAnswered
        self.numberOfQuestionsAnsweredCorrectly = numberOfQuestionsAnsweredCorrectly
        
        super.init(testName: testName, testType: testType)
        
        
    }

    
}


