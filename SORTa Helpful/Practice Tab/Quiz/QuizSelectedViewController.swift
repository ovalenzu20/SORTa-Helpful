//
//  QuizSelectedViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import GameplayKit
import SwiftyJSON

class QuizSelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var questionTableView: UITableView!

    private var question = "What is merge sort's runtime"
    private let possible_answers = ["O(n^2)", "O(n^2)", "O(n^2)", "O(n^2)"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell") as! QuizTableViewCell
        
        cell.setTableLabels(inputQuestion: question, inputPossibleAnswers: possible_answers)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //I want to read the json file and load the algorithms & questions
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
        questionTableView.rowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomizeAnswersPerQuestion(allAlgorithms: [String], possibleAns: [String]) -> [String]
    {
        var randomPossibleAnswers = [String]()
        var shuffeledAlgorithms = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allAlgorithms) as! [String]

        for elem in 0..<possibleAns.count{
            if elem == 0{
                randomPossibleAnswers.append(possibleAns[0])
            }
            else if elem > 0{
                let lastElem = shuffeledAlgorithms.removeLast()
                randomPossibleAnswers.append(lastElem)
            }
        }
        
        let shuffledRandomPossibleAnswers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: randomPossibleAnswers) as! [String]
        
        return shuffledRandomPossibleAnswers
    }
   
    func loadTestFromJSONData(jsonPath: String){
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json")
        {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                let testDictionary = jsonObj.dictionaryValue
                
                for (testName, testData) in testDictionary{
                    
                }
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid Path")
        }
    }
    
    

}
