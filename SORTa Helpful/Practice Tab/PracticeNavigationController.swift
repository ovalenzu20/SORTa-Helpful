//
//  PracticeNavigationController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/17/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class PracticeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func show(_ vc: UIViewController, sender: Any?) {
        setEmptyBackButton(vc)
        super.show(vc, sender: sender)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        setEmptyBackButton(viewController)
        super.pushViewController(viewController, animated: animated)
    }
    
    func setEmptyBackButton(_ viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem =
            UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem?.tintColor = .white
        
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
