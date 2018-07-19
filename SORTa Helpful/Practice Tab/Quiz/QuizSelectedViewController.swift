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
