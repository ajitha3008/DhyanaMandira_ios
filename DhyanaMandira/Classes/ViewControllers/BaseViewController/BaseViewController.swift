//
//  BaseViewController.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 14/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }

    func setupLeftMenuButton() {
        let leftBar:UIBarButtonItem! = UIBarButtonItem(title: "<Menu", style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.LeftSideButtonTapped(_:)));
        //let leftBar:UIBarButtonItem! = UIBarButtonItem(image: UIImage(named: "ic_action_call.png"),         leftBar.title = "
        self.navigationItem.leftBarButtonItem = leftBar;
    }
    
    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    

    func addShadow(baseView:UIView)
    {
        baseView.layer.masksToBounds = false;
        baseView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        baseView.layer.shadowRadius = 5;
        baseView.layer.shadowOpacity = 0.5;
        baseView.layer.borderColor = UIColor.darkGray.cgColor;
        //baseView.layer.borderWidth = 0.5;
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
