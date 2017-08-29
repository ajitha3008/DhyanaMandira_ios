//
//  CallViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class CallViewController: BaseViewController {

    @IBOutlet weak var BAseView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addShadow(baseView: BAseView)
        self.navigationItem.title="Call"
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func call(phoneNumber: String) {
    if let url = URL(string: "tel://\(phoneNumber)") {
    if #available(iOS 10, *) {
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
    UIApplication.shared.openURL(url as URL)
    }
    }
    }
    
    @IBAction func Button734Tapped(_ sender: Any) {
        call(phoneNumber: "+917349782713");
    }
    @IBAction func Button812Tapped(_ sender: Any) {
        call(phoneNumber: "+918123848682");
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
