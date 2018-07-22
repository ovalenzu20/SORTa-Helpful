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

    var quizIndex : Int?
    var quizzes : [Quiz]?
    var currentQuiz : Quiz?
    
    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var questionTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentQuiz!.numberOfQuestions //+ 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.item > currentQuiz!.numberOfQuestions{
//            //MAKE CALCULATE SCORE BUTTON
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! QuizTableViewCell
        
        cell.setQuestionButtonLabels(quiz: currentQuiz!, questionNumber: indexPath.item)

//        let calculateScoreButton = UIButton()
//        calculateScoreButton.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
//        calculateScoreButton.setTitle("FINISH TEST", for: .normal)
//        self.view.addSubview(calculateScoreButton)
        
//        calculateScoreButton.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
//        calculateScoreButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
//        calculateScoreButton.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: 10).isActive = true
//        calculateScoreButton.topAnchor.constraint(equalTo: cell.answersStackView.bottomAnchor, constant: 20).isActive = true
//
//        cell.answersStackView.bottomAnchor.constraint(equalTo: calculateScoreButton.topAnchor, constant: 20).isActive = true
//
//        calculateScoreButton.titleLabel?.text = "CALCULATE SCORE"
//        calculateScoreButton.titleLabel?.font = UIFont(name: "Roboto", size: 20)
//        calculateScoreButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
//        calculateScoreButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        calculateScoreButton.widthAnchor.constraint(equalToConstant: 80)
//        calculateScoreButton.heightAnchor.constraint(equalToConstant: 40.0)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 365
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTableView.allowsSelection = false
        quizzes = loadQuizFromJSONData(jsonPath: "allQuizQuestions")
        print(quizIndex!)
        currentQuiz = quizzes?[quizIndex!]
        
        self.title = currentQuiz!.quizName  //set testName
        self.navigationItem.setHidesBackButton(true, animated:true);

//        quizName.text! = currentQuiz!.quizName  //set testName
        
        
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
        questionTableView.rowHeight = 200
        
        //addCalculateScoreButton()
    }
    
    //goes into table view and adds to last cell
    func addCalculateScoreButton(){
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    func loadQuizFromJSONData(jsonPath: String) -> [Quiz]{
        var allQuizzes = [Quiz]()
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: jsonData)
                
                
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
        return allQuizzes
    }
    
    func createQuizFromJson(jsonData: (String, JSON)) -> Quiz{
        let currentQuiz = Quiz(quizName: jsonData.0)
        var quizQuestions = [Question]()
        
        
        for elem in jsonData.1{
            let possibleAnsAsJsonArr = elem.1["possibleAnswers"].array!
            let possibleAnsAsStringArr = convertJsonArrayToStringArray(jsonArray: possibleAnsAsJsonArr)
            let correctAns = elem.1["correctAnswers"].string!
            
            //TODO: get the question's name on the label
            //elem.1 -> (STRING, JSON)
            //elem.1.0 is what i what
            let currentQuestion = Question(question: elem.0, possibleAnswers: possibleAnsAsStringArr, correctAnswer: correctAns)
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
