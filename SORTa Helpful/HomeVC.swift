//
//  HomeVC.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 8/6/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import SafariServices

class HomeVC: UIViewController {
    
    @IBAction func didClickOmarValenzuela(_ sender: Any) {
        let omarsLinkedIn = URL(string: "https://www.linkedin.com/in/omar-valenzuela-63bba114a/")
        let svc = SFSafariViewController(url: omarsLinkedIn!)
        present(svc, animated: true, completion: nil)
    }
    
    
    @IBAction func didClickBrandonTeran(_ sender: Any) {
        let brandonsLinkedIn = URL(string: "https://www.linkedin.com/in/brandon-teran-736593139/")
        let svc = SFSafariViewController(url: brandonsLinkedIn!)
        present(svc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
