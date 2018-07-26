//
//  QuizViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBAction func identifyAlgorithm(_ sender: Any) {
        sendTestType(currentQuizIndex: 4)
    }
    
    @IBAction func identifyComplexities(_ sender: Any) {
        sendTestType(currentQuizIndex: 3)
    }
    
    @IBAction func identifyTypes(_ sender: Any) {
        sendTestType(currentQuizIndex: 2)
    }
    
    @IBAction func situationMatching(_ sender: Any) {
        sendTestType(currentQuizIndex: 1)
    }
    
    @IBAction func mixedTest(_ sender: Any) {
        sendTestType(currentQuizIndex: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendTestType(currentQuizIndex: Int){
        let quizVC = storyboard?.instantiateViewController(withIdentifier: "QuizSelectedVC") as? QuizSelectedVC
        quizVC?.quizIndex = currentQuizIndex
        self.navigationController?.pushViewController(quizVC!, animated: true)
    }
    
}
