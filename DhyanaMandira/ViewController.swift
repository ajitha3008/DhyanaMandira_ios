//
//  ViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 29/06/17.
//  Copyright © 2/Users/ajithayasmin/Desktop/iOS/DhyanaMandira/DhyanaMandira/LeftSideNavViewController.swift017 AjithaYasmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Yoga @ Dhyana Mandira"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }

}

