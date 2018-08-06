//
//  QuizCVCell.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/25/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol QuizCVCellDelegate: class {
    func didChooseAnswer(btnIndex: Int)
}

class QuizCVCell: UICollectionViewCell {
    weak var delegate: QuizCVCellDelegate?

    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    
    var btnsArray = [UIButton]()

    var currentQuestion: Question? {
        didSet {
            guard let unwrappedQue = currentQuestion else { return }
            if unwrappedQue.belongsToQuiz == "IDENTIFY ALGORITHMS"{
                questionLabel.text = getPseudocodeFromFile(question: unwrappedQue)
            }
            else {
                if unwrappedQue.question.contains("_"){
                    questionLabel.text = unwrappedQue.question
                    questionLabel.textAlignment = .left
                }
                else{
                    questionLabel.text = unwrappedQue.question
                    questionLabel.textAlignment = .center
                    questionLabel.font = UIFont(name: "Roboto", size: 20)
                }
                
            }
            btn1.setTitle(unwrappedQue.possibleAnswers[0], for: .normal)
            btn2.setTitle(unwrappedQue.possibleAnswers[1], for: .normal)
            btn3.setTitle(unwrappedQue.possibleAnswers[2], for: .normal)
            btn4.setTitle(unwrappedQue.possibleAnswers[3], for: .normal)
            let answerIndex = unwrappedQue.possibleAnswers.index(of: unwrappedQue.correctAnswer)!
            if unwrappedQue.isAnswered {
                btnsArray[answerIndex].backgroundColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1)
                if unwrappedQue.incorrectAnswer >= 0 {
                    btnsArray[unwrappedQue.incorrectAnswer].backgroundColor = #colorLiteral(red: 0.8585642699, green: 0.1764705882, blue: 0.1254901961, alpha: 1)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        btnsArray = [btn1, btn2, btn3, btn4]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @objc func btnOptionAction(sender: UIButton) {
        guard let unwrappedQue = currentQuestion else { return }
        if !unwrappedQue.isAnswered {
            delegate?.didChooseAnswer(btnIndex: sender.tag)
        }
    }
    
    override func prepareForReuse() {
        btn1.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        btn2.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        btn3.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        btn4.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
    }
    
    func setupViews() {
        
        addSubview(questionLabel)
        questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive=true
        questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive=true
        questionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive=true
        questionLabel.heightAnchor.constraint(equalToConstant: 330).isActive=true
        
        let btnWidth: CGFloat = 150
        let btnHeight: CGFloat = 50
        btn1 = getButton(tag: 0)
        addSubview(btn1)
        NSLayoutConstraint.activate([btn1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 35), btn1.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -10), btn1.widthAnchor.constraint(equalToConstant: btnWidth), btn1.heightAnchor.constraint(equalToConstant: btnHeight)])
        btn1.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        btn2 = getButton(tag: 1)
        addSubview(btn2)
        NSLayoutConstraint.activate([btn2.topAnchor.constraint(equalTo: btn1.topAnchor), btn2.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 10), btn2.widthAnchor.constraint(equalToConstant: btnWidth), btn2.heightAnchor.constraint(equalToConstant: btnHeight)])
        btn2.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        btn3 = getButton(tag: 2)
        addSubview(btn3)
        NSLayoutConstraint.activate([btn3.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 20), btn3.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -10), btn3.widthAnchor.constraint(equalToConstant: btnWidth), btn3.heightAnchor.constraint(equalToConstant: btnHeight)])
        btn3.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        btn4 = getButton(tag: 3)
        addSubview(btn4)
        NSLayoutConstraint.activate([btn4.topAnchor.constraint(equalTo: btn3.topAnchor), btn4.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 10), btn4.widthAnchor.constraint(equalToConstant: btnWidth), btn4.heightAnchor.constraint(equalToConstant: btnHeight)])
        btn4.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
    }
    
    let questionLabel: UILabel = {
        let lbl=UILabel()
        lbl.text="This is a question and you have to answer it?"
        lbl.textColor=UIColor.white
        lbl.numberOfLines = 100
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto", size: 15)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    func getButton(tag: Int) -> UIButton {
        let btn = UIButton()
        btn.tag = tag
        btn.setTitle("Option", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 15)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.168627451, green: 0.1647058824, blue: 0.2, alpha: 1)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.cornerRadius = 5
        btn.clipsToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }

    func createQuestionLabel(){
        questionLabel.text! = currentQuestion!.question
        if currentQuestion!.belongsToQuiz == "IDENTIFY ALGORITHMS"{
            let psuedocode = getPseudocodeFromFile(question: currentQuestion!)
            questionLabel.numberOfLines = 100
            questionLabel.text! = psuedocode
            questionLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            questionLabel.font = questionLabel.font.withSize(12)
            questionLabel.textAlignment = NSTextAlignment.left
        }
        else{
            questionLabel.text! = currentQuestion!.question
            questionLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            questionLabel.font = questionLabel.font.withSize(12)
            questionLabel.textAlignment = NSTextAlignment.left
        }
    }
    
    func getPseudocodeFromFile(question: Question) -> String {
        let fileUrl = Bundle.main.path(forResource: question.question, ofType: "txt")
        var pseudoCodeString = ""
        
        do {
            pseudoCodeString = try String(contentsOfFile: fileUrl!, encoding: .utf8)
            pseudoCodeString.removeLast()
        } catch let error as NSError {
            print(error.localizedDescription)
            return "Error loading pseudocode"
        }
        
        return pseudoCodeString
    }
    
//    func setQuestionButtonLabels(question: Question)
//    {
//        var answerIndex = 0
//        currentQuestion = question
//        questionName.text! = currentQuestion!.question
//        if question.belongsToQuiz == "IDENTIFY ALGORITHMS"{
//            let psuedocode = getPseudocodeFromFile(question: currentQuestion!)
//            questionName.numberOfLines = 100
//            questionName.text! = psuedocode
//            questionName.textColor =  colorLiteral(red: 1, green: 0.9843137255, blue: 0, alpha: 1)
//            questionName.font = questionName.font.withSize(12)
//            questionName.textAlignment = NSTextAlignment.left
//
//            questionName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
//
//        }
//
//        for posAnswer in currentQuestion!.possibleAnswers{
//            possibleAnswers[answerIndex].setTitle(posAnswer, for: UIControlState.normal)
//            answerIndex += 1
//        }
//    }
}
