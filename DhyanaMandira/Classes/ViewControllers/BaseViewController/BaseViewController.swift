//
//  BaseViewController.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 14/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import EasyTipView

class BaseViewController: UIViewController {
    
    var preferences = EasyTipView.Preferences()
    var tipView: EasyTipView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.initializingNitificationView()
    }
    
    func initializingNitificationView()
    {
        
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor(colorLiteralRed: 184/255.0, green: 132/255.0, blue: 35/255.0, alpha: 1)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        
        EasyTipView.globalPreferences = preferences
    }
    func setupLeftMenuButton() {
        let leftBar:UIBarButtonItem! = UIBarButtonItem(title: "<Menu", style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.LeftSideButtonTapped(_:)));
        //let leftBar:UIBarButtonItem! = UIBarButtonItem(image: UIImage(named: "ic_action_call.png"),         leftBar.title = "
        self.navigationItem.leftBarButtonItem = leftBar;
        self.setupNotificationButton()
    }
    func setupNotificationButton() {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "notificationBell"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(self.didClickOnNotificationView(_:)), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        self.navigationItem.rightBarButtonItem = item1;
    }
    
    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    func didClickOnNotificationView(_ sender: UIButton)
    {
        if tipView == nil
        {
            var notificationStr = UserDefaults.standard.value(forKey: "notification") as? String
            if notificationStr?.characters.count == 0 || notificationStr == nil {
                notificationStr = "No notification available at this time."
            }
            
            tipView = EasyTipView(text: notificationStr!, preferences: preferences)
            tipView.show(forView: sender, withinSuperview: UIApplication.shared.keyWindow)
        }else
        {
            tipView.dismiss()
            tipView = nil
        }
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
