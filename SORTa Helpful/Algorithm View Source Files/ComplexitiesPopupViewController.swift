//
//  ComplexitiesPopupViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class ComplexitiesPopupViewController: UIViewController {

    @IBOutlet weak var bigoInfoLabel:  UILabel!
    @IBOutlet weak var thetaInfoLabel: UILabel!
    @IBOutlet weak var omegaInfoLabel: UILabel!
    @IBOutlet weak var exitButton: UIButtonCustom!
    
    @IBAction func dismissPopupButton(_ sender: SearchFilterButton) {
        exitButton.isHighlighted = true
        dismiss(animated: true)
    }
    
    func setInfoLabels() {
        bigoInfoLabel.text  = """
        Big-O notation is the most commonly used notation to express an algorithm's performance. It is a method of expressing the upper bound on the growth rate of an algorithm's running time. In other words, we can say that it is the longest amount of time an algorithm could possibly take to execute.
        """
        thetaInfoLabel.text = """
        Theta (Θ) notation is a method of expressing the asymptotic tight bound on the growth rate of an algorithm's running time both from above and below. In other words, we can say that it describes both the minimum and maximum amount of time an algorithm could possibly take to execute.
        """
        omegaInfoLabel.text = """
        Omega (Ω) notation is a method of expressing the asymptotic tight bound on the growth rate of an algorithm's running time from below. In other words, we can say that it is the shortest amount of time an algorithm could possibly take to execute.
        """
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInfoLabels()
    }

}
