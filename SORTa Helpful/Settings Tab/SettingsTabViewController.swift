//
//  SettingsTabViewController.swift
//  SORTa Helpful
//
//  Created by Omar Valenzuela on 7/15/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class SettingsTabViewController: UIViewController {
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
        mailComposerVC.setToRecipients(["ovalenzu@uci.edu", "bteran@uci.edu"])
        mailComposerVC.setSubject("SORTa Helpful - Contact")
        mailComposerVC.setMessageBody("Thank you for contacting us! We are more than happy to answer any questions or concersn you may have.", isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeViewController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        sendMailErrorAlert.addAction(cancelAction)
        present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    @IBAction func didClickNotificationSettings(_ sender: Any) {
    }
    
    @IBAction func didClickGiveFeedback(_ sender: Any) {
    }
    
    @IBAction func didClickViewGithub(_ sender: Any) {
        let githubLink = URL(string: "https://github.com/ovalenzu20/SORTa-Helpful")
        let svc = SFSafariViewController(url: githubLink!)
        present(svc, animated: true, completion: nil)
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
