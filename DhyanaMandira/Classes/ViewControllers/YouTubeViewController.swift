//
//  YouTubeViewController.swift
//  DhyanaMandira
//
//  Created by Ajitha Yasmin on 25/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class YouTubeViewController: BaseViewController {

    @IBOutlet weak var BAseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Videos"
        self.addShadow(baseView: BAseView)
        self.setupLeftMenuButton()
        // mPlayer.cueVideo("E-F6h6yAdjs");
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
