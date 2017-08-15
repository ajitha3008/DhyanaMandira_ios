//
//  AshtangaViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 03/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class AshtangaViewController: BaseViewController {

    @IBOutlet weak var astangaTextView: UITextView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\"><font color=\"#ff9933\"><b>\"ASTANGA YOGA\" - a path towards \"ULTIMATE\"</b></font><br><br>Pathanjali Maharshi\'s Astanga Yoga Sutras (8 limbs) are simple and most effective guidelines to reach an \"Ultimate\" state of life. Yama, Niyama, Asana, Pranayama, Pratyahara, Dharana, Dhyana & Samadhi - the path that takes one towards ultimate.<br><br>These 8 sutras with more sub sutras help the practitioner for total personality development. The Physical, Mental, Emotional, Social, Spiritual wellbeing are the aims. The Yogic Life is much needed for Individual health and social harmony.<br><br><i><font color=\"#ff9933\">How this is being achieved here..?? see the next page on \"DHYANA MANDIRA\" - a \"PLATFORM\" to \"TRANSFORM\".</font></i></p></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Astanga Yoga"
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        
       
        
        astangaTextView.attributedText = attributedString
        self.setupLeftMenuButton()
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
