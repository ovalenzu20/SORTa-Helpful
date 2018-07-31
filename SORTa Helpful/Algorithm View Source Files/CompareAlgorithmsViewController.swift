//
//  CompareAlgorithmsViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 7/30/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class CompareAlgorithmsViewController: UIViewController {
    
    @IBOutlet weak var primaryAlgoLabel   : UILabel!
    @IBOutlet weak var secondaryAlgoLabel : UILabel!
    
    @IBOutlet weak var primaryAnimationView   : ArrayStackView!
    @IBOutlet weak var secondaryAnimationView : ArrayStackView!
    
    
    private func setupAnimationViews() {
        primaryAnimationView.setup(array: <#T##[Int]#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        secondaryAnimationView.setup(array: <#T##[Int]#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    
    
    @IBAction func exitPopupView(_ sender: UIButtonCustom) {
        
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
