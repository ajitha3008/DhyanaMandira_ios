//
//  ViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 29/06/17.
//  Copyright © 2/Users/ajithayasmin/Desktop/iOS/DhyanaMandira/DhyanaMandira/LeftSideNavViewController.swift017 AjithaYasmin. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var aboutTextView: UITextView!
    
    @IBOutlet weak var BaseView: UIView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\">\"Yoga Mandira\" is a center for Yoga & Spiritual activities. It was started in the year 2009. Aimed at well being of individuals and social harmony through yoga. The traditional and ancient method of Astanga Yoga is the kind of yoga being followed here. We provide FREE yoga training to anybody who joins as a beginner. We conduct daily yogasana practice sessions and other associated activities at early morning hours.<br><br>New batches will be initiated every 5 weeks. New people(yoga aspirants) can join new batch by taking life time membership with just Rs100/-.  The beginners will be trained with all basic exercises(body, breath & mind). More than 100 Asanas, Surya Namaskara and Pranayama etc., will be taught. Also, with various training methods, the practitioners will be fine tuned and made to perfect practice of asanas. After undergoing the basic training, people can continue regular practice at \"Yoga Mandira\" premises as long as they wish to. No monthly fees for life time.<br><br>Apart from daily asana sessions, there will be many special events & programs for total personality development. Satsanga, Bauddhik sessions, lectures, social service activities, yoga awareness activities etc., will be conducted.<br><br>\"Yoga Mandira\" is a divine hall at Sri Someshwara (Shiva) Temple premises in Madiwala, BTM 1st Stage, Bangalore-560 068.<br><p style=\"font-size:18px\" align=\"center\">!!!......HARI AUM......!!!</p></p></body></Html>";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Yoga @ Yoga Mandira"
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        self.addShadow(baseView: BaseView)
        aboutTextView.attributedText = attributedString
        // Do any additional setup after loading the view, typically from a nib.
        self.setupLeftMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    @IBAction func LeftSideButtonTapped(_ sender: Any) {
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
//    }

}

