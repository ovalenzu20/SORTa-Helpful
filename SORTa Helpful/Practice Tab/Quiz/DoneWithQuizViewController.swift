//
//  DoneWithQuizViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/22/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class DoneWithQuizViewController: UIViewController {

    @IBOutlet weak var letterGrade: UILabel!
    @IBOutlet weak var gradeDescription: UILabel!
    var currentQuiz : Quiz?
    
    var score = 0
    var totalScore = 0
    
    
    @IBAction func clickedReturnToMenu(_ sender: Any) {
//        let mainMenu = storyboard?.instantiateViewController(withIdentifier: "PracticeViewController") as? PracticeViewController
//        navigationController?.pushViewController(mainMenu!, animated: true)
////        performSegue(withIdentifier: "QuizViewController", sender: self)
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels(quiz: currentQuiz!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateScore() -> Float{
        let quizScore = Double(score) / Double(totalScore)
        let quizScoreRounded = round(quizScore, toDecimalPlaces: 2)
        return Float(quizScoreRounded)
    }
    
    func round(_ value: Double, toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(value * divisor) / divisor
    }
    
    func calculateLetterGrade() -> String{
        let gradePercentage = calculateScore()


        if gradePercentage >= 0.97{
            return "A+"
        }
        else if 0.97 > gradePercentage && gradePercentage >= 0.93{
            return "A"
        }
        else if 0.93 > gradePercentage && gradePercentage >= 0.90{
            return "A-"
        }
            
            
        else if 0.90 > gradePercentage && gradePercentage >= 0.87{
            return "B+"
        }
        else if 0.87 > gradePercentage && gradePercentage >= 0.83{
            return "B"
        }
        else if 0.83 > gradePercentage && gradePercentage >= 0.80{
            return "B-"
        }
            
            
        else if 0.80 > gradePercentage && gradePercentage >= 0.77{
            return "C+"
        }
        else if 0.77 > gradePercentage && gradePercentage >= 0.73{
            return "C"
        }
        else if 0.73 > gradePercentage && gradePercentage >= 0.70{
            return "C-"
        }
        
        
        else if 0.70 > gradePercentage && gradePercentage >= 0.67{
            return "D+"
        }
        else if 0.67 > gradePercentage && gradePercentage >= 0.63{
            return "D"
        }
        else if 0.63 > gradePercentage && gradePercentage >= 0.60{
            return "D-"
        }
        
        else{
            return "F"
        }
        
    }
    
    func setUpLabels(quiz: Quiz){
        letterGrade.text! = calculateLetterGrade()
        let correctlyAnswered = score
        let numberOfQuestions = totalScore
        gradeDescription.text! = "You correctly answered \(correctlyAnswered) out of \(numberOfQuestions) questions"
    }

}
