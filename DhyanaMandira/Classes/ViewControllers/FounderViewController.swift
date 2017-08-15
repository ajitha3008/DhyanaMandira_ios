//
//  FounderViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 03/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class FounderViewController: BaseViewController {

    @IBOutlet weak var founderTextView: UITextView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\">\"Shri Rajkumar Gour\" is Mukhya Yoga Shikshaka and Chief Administrator at \"Dhyana Mandira\". He chose Yoga as a path of service in the year 2009 and has provided yoga coaching to more than 5500 people as of now. He is a Yoga Pracharak and Yoga Shikshaka. His service in the yoga field through this Dhyana Mandira is great inspiration and motivation for the people who get associated with this yoga kendra. Many lives have changed with his way of yoga teachings and thus his service is a noticeable contribution to the society. His selfless and constant efforts have made \"Dhyana Mandira\" - as an epicenter of Yoga in this region of Bangalore.</p></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.title="Founder"
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
     
        founderTextView.attributedText = attributedString
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//
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
