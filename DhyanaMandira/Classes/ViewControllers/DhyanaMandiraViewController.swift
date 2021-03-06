//
//  DhyanaMandiraViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 03/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class DhyanaMandiraViewController: BaseViewController {

    @IBOutlet weak var platformTextView: UITextView!
    
    @IBOutlet weak var baseView: UIView!
    let htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><font color=\"#ff9933\"><b>\"YOGA MANDIRA\" - a \"PLATFORM\" to \"TRANSFORM\"</b></font><br><br>At Yoga Mandira, The Astanga Yoga Sutras are being delivered to Yoga aspirants through various Yogic activities, Satsanga, Special events, Nature & Spiritual spots visits, etc.<br><br>A brief Syllabus during basic course period of 5 weeks:<ul><li>Briefings on Yoga Shastra</li><li>Mind control exercises</li><li>Breathing exercises</li><li>Body joints exercises (can be utilized as workplace exercises)</li><li>Yogasanas (more than 100) practice</li><li>Surya Namaskara</li><li>Pranayama sessions</li><li>Yoga Shibhiras (Camps at special places)</li><li>Special sessions on personality development (Stress management, Self-confidence, Communication skills, Art of Public speech, Simplicity etc.)</li><li>Fine tuning Asanas practice through various techniques</li><li>Mantras</li></ul><br><i><font color=\"#ff9933\">Refer next page for the Abhyasas (activities) for daily practice.</font></i></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Yoga Mandira"
        
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        
        platformTextView.attributedText = attributedString
        self.setupLeftMenuButton()
        addShadow(baseView: baseView)
        platformTextView.clipsToBounds = true;
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
