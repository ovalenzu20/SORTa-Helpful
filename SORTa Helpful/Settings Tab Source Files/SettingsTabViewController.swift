//
//  SettingsTabViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/15/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import MessageUI

class SettingsTabViewController: UIViewController {
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
        mailComposerVC.setToRecipients(["ovalenzu@uci.edu", "bteran@uci.edu"])
        mailComposerVC.setSubject("SORTa Helpful - Contact")
        mailComposerVC.setMessageBody("Thank you for contacting us! We are more than happy to answer any questions or concersn you may have.", isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send Email.  Please check Email configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    @IBAction func didClickNotificationSettings(_ sender: Any) {
    }
    
    @IBAction func didClickGiveFeedback(_ sender: Any) {
    }
    
    @IBAction func didClickViewGithub(_ sender: Any) {
        if let url = URL(string: "https://github.com/ovalenzu20/SORTa-Helpful") {
            if #available(iOS 10, *){
                UIApplication.shared.open(url)
            }else{
                UIApplication.shared.openURL(url)
            }
            
        }
    }
    
    @IBAction func didClickContactDevelopers(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
