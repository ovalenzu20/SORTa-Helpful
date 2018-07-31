//
//  ChooseAlgorithmViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/30/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class ChooseAlgorithmViewController: UIViewController {
    @IBOutlet weak var algoNameLabel: UILabel!
    @IBOutlet weak var selectAlgorithmPickerView: AlgorithmPickerView!
    
    @IBAction func nextButton(_ sender: UIButtonCustom) {
        
    }
    
    
    private func setupPickerView() {
//        selectAlgorithmPickerView.
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
