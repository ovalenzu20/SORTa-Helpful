//
//  IntroViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 8/8/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import paper_onboarding

class IntroViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{
    
    @IBOutlet weak var startLearningButton : UIButton!
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        <#code#>
    }
    

    @IBOutlet weak var onboardingView: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
