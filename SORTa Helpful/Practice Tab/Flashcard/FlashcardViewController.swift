//
//  flashcardViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/15/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Connoisseurs", size: 70)!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



