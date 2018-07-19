//
//  QuizSelectedViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

import SwiftyJSON

class QuizSelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var questionTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! QuizTableViewCell
        
        //cell.setTableLabels(inputQuestion: question, inputPossibleAnswers: possible_answers)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //I want to read the json file and load the algorithms & questions
        loadTestFromJSONData(jsonPath: "allQuizQuestions")
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
        questionTableView.rowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    func loadTestFromJSONData(jsonPath: String){
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: jsonData)
                
                var allQuizzes = [Quiz]()
                for quizType in json{
                    let quiz = createQuizFromJson(jsonData: quizType)
                    allQuizzes.append(quiz)
                }
            } catch let error {
                // In the future add function that displays empty cells and prompts user to reload page
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            // In the future add function that displays empty cells and prompts user to reload page
            print("Invalid filename/path.")
        }
       
    }
    
    func createQuizFromJson(jsonData: (String, JSON)) -> Quiz{
        let currentQuiz = Quiz(quizName: jsonData.0)
        var quizQuestions = [Question]()
        
        for elem in jsonData.1{
            let possibleAnsAsJsonArr = elem.1["possibleAnswers"].array!
            let possibleAnsAsStringArr = convertJsonArrayToStringArray(jsonArray: possibleAnsAsJsonArr)
            let correctAns = elem.1["correctAnswers"].string!
            
            let currentQuestion = Question(question: jsonData.0, possibleAnswers: possibleAnsAsStringArr, correctAnswer: correctAns)
            quizQuestions.append(currentQuestion)
        }
        currentQuiz.addMultipleQuestions(questionsToAdd: quizQuestions)
        
        return currentQuiz
    }
    
    func convertJsonArrayToStringArray(jsonArray: [JSON]) -> [String]{
        var tempStringArr = [String]()
        for jsonElem in jsonArray{
            tempStringArr.append(jsonElem.string!)
        }
        return tempStringArr
    }
}
