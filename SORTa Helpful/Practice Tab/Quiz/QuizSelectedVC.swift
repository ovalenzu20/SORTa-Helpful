//
//  QuizSelectedVC.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/25/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON
import GameplayKit

class QuizSelectedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var quizIndex : Int?
    var currentQuiz: Quiz?
    var score: Int = 0
    var currentQuestionNumber = 1
    var quizCV: UICollectionView!

    var allPossibleAlgorithms = ["Insertion Sort", "Selection Sort", "Comb Sort", "Merge Sort", "Quick Sort", "Bubble Sort", "Binary Insertion Sort", "Radix Sort", "Counting Sort", "Cocktail Sort", "Heap Sort", "Insertion Sort", "Pigeonhole Sort"]
    var allPossibleTypes = ["Stable","In Place", "Stable & In Place", "Divide & Conquer"]
    var allPossibleRuntimes = ["O(1)", "O(n)", "O(n²)", "O(nlogn)","O(logn)","O(n³)","O(2ⁿ)","O(n!)"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentQuiz!.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quizCell", for: indexPath) as! QuizCVCell
        cell.currentQuestion = currentQuiz!.questions[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let allQuizzes = loadQuizFromJSONData(jsonPath: "allQuizQuestions")
        currentQuiz = allQuizzes[quizIndex!]
        currentQuiz!.shuffleAllQuestions()
        self.title = currentQuiz!.quizName
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        quizCV = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        quizCV.delegate = self
        quizCV.dataSource = self
        quizCV.register(QuizCVCell.self, forCellWithReuseIdentifier: "quizCell")
        quizCV.showsHorizontalScrollIndicator = false
        quizCV.translatesAutoresizingMaskIntoConstraints=false
        quizCV.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        quizCV.isPagingEnabled = true
        quizCV.delegate = self
        quizCV.dataSource = self
        
        self.view.addSubview(quizCV)
        
        setupViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setQuestionNumber()
    }
    
    func setQuestionNumber() {
        let x = quizCV.contentOffset.x
        let w = quizCV.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage < currentQuiz!.questions.count {
            lblQueNumber.text = "Question: \(currentPage+1) / \(currentQuiz!.questions.count)"
            currentQuestionNumber = currentPage + 1
        }
    }
    
    @objc func btnPrevNextAction(sender: UIButton) {
        if sender == btnNext && currentQuestionNumber == currentQuiz!.questions.count {
            btnNext.setTitle("See Quiz Results", for: .normal)
            let quizDoneVC = storyboard?.instantiateViewController(withIdentifier: "DoneWithQuizViewController") as? DoneWithQuizViewController
            quizDoneVC?.currentQuiz = currentQuiz
            quizDoneVC?.score = score
            quizDoneVC?.totalScore = currentQuiz!.questions.count
            quizDoneVC?.view.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
            self.navigationController?.pushViewController(quizDoneVC!, animated: true)
            return
        }
        
        let collectionBounds = self.quizCV.bounds
        var contentOffset: CGFloat = 0
        if sender == btnNext {
            contentOffset = CGFloat(floor(self.quizCV.contentOffset.x + collectionBounds.size.width))
            currentQuestionNumber += currentQuestionNumber >= currentQuiz!.questions.count ? 0 : 1
        } else {
            contentOffset = CGFloat(floor(self.quizCV.contentOffset.x - collectionBounds.size.width))
            currentQuestionNumber -= currentQuestionNumber <= 0 ? 0 : 1
        }
        self.moveToFrame(contentOffset: contentOffset)
        lblQueNumber.text = "Question: \(currentQuestionNumber) / \(currentQuiz!.questions.count)"
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset ,y : self.quizCV.contentOffset.y ,width : self.quizCV.frame.width,height : self.quizCV.frame.height)
        self.quizCV.scrollRectToVisible(frame, animated: true)
    }
    
    func setupViews() {
        quizCV.topAnchor.constraint(equalTo: self.view.topAnchor).isActive=true
        quizCV.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        quizCV.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        quizCV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true

        self.view.addSubview(btnPrev)
        btnPrev.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnPrev.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive=true
        btnPrev.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        btnPrev.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true

        self.view.addSubview(btnNext)
        btnNext.heightAnchor.constraint(equalTo: btnPrev.heightAnchor).isActive=true
        btnNext.widthAnchor.constraint(equalTo: btnPrev.widthAnchor).isActive=true
        btnNext.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        btnNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive=true

        self.view.addSubview(lblQueNumber)
        lblQueNumber.heightAnchor.constraint(equalToConstant: 20).isActive=true
        lblQueNumber.widthAnchor.constraint(equalToConstant: 150).isActive=true
        lblQueNumber.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive=true
        lblQueNumber.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive=true
        lblQueNumber.text = "Question: \(1) / \(currentQuiz!.questions.count)"

        self.view.addSubview(lblScore)
        lblScore.heightAnchor.constraint(equalTo: lblQueNumber.heightAnchor).isActive=true
        lblScore.widthAnchor.constraint(equalTo: lblQueNumber.widthAnchor).isActive=true
        lblScore.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive=true
        lblScore.bottomAnchor.constraint(equalTo: lblQueNumber.bottomAnchor).isActive=true
        lblScore.text = "Score: \(score) / \(currentQuiz!.questions.count)"
    }
    
    let btnPrev: UIButton = {
        let btn=UIButton()
        btn.setTitle("< Previous", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let btnNext: UIButton = {
        let btn=UIButton()
        btn.setTitle("Next >", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2274509804, green: 0.3921568627, blue: 1, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let lblQueNumber: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.font = UIFont(name: "Roboto-Regular", size: 16)
        lbl.textColor=UIColor.gray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.gray
        lbl.textAlignment = .right
        lbl.font = UIFont(name: "Roboto-Regular", size: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    func loadQuizFromJSONData(jsonPath: String) -> [Quiz]{
        var allQuizzes = [Quiz]()
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: jsonData)
                
                for quizType in json{
                    if quizType.0 != "MIXED QUIZ"{
                        let quiz = createQuizFromJson(jsonData: quizType)
                        allQuizzes.append(quiz)
                    }
                }
                allQuizzes.append(generateMixedQuiz(allQuizzes: allQuizzes))

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
    
    func containsQuestion(quiz: Quiz, question: Question) -> Bool{
        for q in quiz.questions{
            if q.question == question.question{
                return true
            }
        }
        return false
    }
    
    func generateMixedQuiz(allQuizzes: [Quiz]) -> Quiz{
        let mixedQuiz = Quiz(quizName: "MIXED QUIZ")
        
        while mixedQuiz.numberOfQuestions < 10{
            let randomQuizNumber = arc4random_uniform(2) + 1; //a number from 1-3
            let randomQuiz = allQuizzes[Int(randomQuizNumber)]
            let randomQuestionNumber = arc4random_uniform(UInt32(randomQuiz.numberOfQuestions))
            let randomQuestion = randomQuiz.questions[Int(randomQuestionNumber)]
            
            if !containsQuestion(quiz: mixedQuiz, question: randomQuestion){
                mixedQuiz.addQuestion(question: randomQuestion)
            }
        }
        return mixedQuiz
    }
    
    func createQuizFromJson(jsonData: (String, JSON)) -> Quiz{
        let currentQuiz = Quiz(quizName: jsonData.0)
        var quizQuestions = [Question]()
        
        
        for elem in jsonData.1{     //jsonData = (String, JSON), elem = (String, JSON) too ##Dictionary inside dictionary
            if elem.0 != "description"{
                let possibleAnsAsJsonArr = elem.1["possibleAnswers"].array!
                let possibleAnsAsStringArr = convertJsonArrayToStringArray(jsonArray: possibleAnsAsJsonArr)
                let correctAns = elem.1["correctAnswers"].string!
                
                let currentQuestion = Question(question: elem.0, possibleAnswers: possibleAnsAsStringArr, correctAnswer: correctAns, belongsToQuiz: currentQuiz.quizName)
                mixPossibleAnswers(question: currentQuestion)
                
                quizQuestions.append(currentQuestion)
            }
            else if elem.0 == "description"{
                currentQuiz.quizDescription = elem.1.string!
            }
        }
        
        currentQuiz.addMultipleQuestions(questionsToAdd: quizQuestions)
        return currentQuiz
    }
    
    func randomizeAnswers(answersToRandomize: [String], answersToMixIn: [String]) -> [String]
    {
        var randomPossibleAnswers = [String]()
        var allAlgorithmsShuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answersToMixIn) as! [String]
        var currentElem = 0
        
        while randomPossibleAnswers.count < 4{
            if currentElem == 0 {
                randomPossibleAnswers.append(answersToRandomize[0])
            }
            else {
                let lastElem = allAlgorithmsShuffled.removeLast()
                if !randomPossibleAnswers.contains(lastElem){
                    randomPossibleAnswers.append(lastElem)
                }
            }
            currentElem += 1
        }
        //shuffle final result
        let shuffledRandomPossibleAnswers = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: randomPossibleAnswers) as! [String]
        
        return shuffledRandomPossibleAnswers
    }
    
    func convertJsonArrayToStringArray(jsonArray: [JSON]) -> [String]{
        var tempStringArr = [String]()
        
        for jsonElem in jsonArray{
            tempStringArr.append(jsonElem.string!)
        }
        
        return tempStringArr
    }
    
    func findQuestionCategory(question: Question) -> [String]{
        switch question.belongsToQuiz {
        case "IDENTIFY ALGORITHMS":
            return self.allPossibleAlgorithms
        case "IDENTIFY COMPLEXITIES":
            return self.allPossibleRuntimes
        case "IDENTIFY TYPES":
            return self.allPossibleTypes
        default:
            return [""]
        }
    }
    
    func mixPossibleAnswers(question : Question){
        let answersToMixIn = findQuestionCategory(question: question)
        question.possibleAnswers = randomizeAnswers(answersToRandomize: question.possibleAnswers, answersToMixIn: answersToMixIn)
    }
    
    
}

extension QuizSelectedVC: QuizCVCellDelegate {
    func didChooseAnswer(btnIndex: Int) {
        let centerIndex = getCenterIndex()
        guard let index = centerIndex else { return }
        currentQuiz?.questions[index.item].isAnswered = true
        let currentQ = currentQuiz!.questions[index.item]
        let answerIndex = currentQ.possibleAnswers.index(of: currentQ.correctAnswer)!
        
        if answerIndex != btnIndex {
            currentQuiz?.questions[index.item].incorrectAnswer = btnIndex
            
        } else {
            score += 1
        }
        
        lblScore.text = "Score: \(score) / \(currentQuiz!.questions.count)"
        quizCV.reloadItems(at: [index])
    }
    
    func getCenterIndex() -> IndexPath? {
        let center = self.view.convert(self.quizCV.center, to: self.quizCV)
        let index = quizCV!.indexPathForItem(at: center)
        print(index ?? "index not found")
        return index
    }
}

