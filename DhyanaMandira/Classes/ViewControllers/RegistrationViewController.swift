//
//  RegistrationViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 03/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {

    @IBOutlet weak var costTextView: UITextView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\">We believe YOGA is a field of service. Hence, we have not commercialized Yoga. Yoga aspirants can take life time membership by paying only Rs.100/-. There is NO monthly fees for providing training & venue for daily practice. You will be provided a continued guidance for life time.<br><br>New people can join during new batches. Register for new batches through telephone call, SMS, Whatsapp or Email. Just send your Full name, Whatsapp number(preferably) and Email ID to the contact details provided. We will inform you about the dates for next new batch.<br><br>We have enough place for Yoga practice. Any number of people can join. Inform and spread to everyone you know.</p></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Registration Formality"
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        costTextView.attributedText = attributedString
        self.addShadow(baseView: costTextView)
        self.setupLeftMenuButton()
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    @IBAction func LeftSideButtonTapped(_ sender: Any) {
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
