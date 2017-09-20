//
//  DMNotificationView.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 29/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class DMNotificationView: UIView {

    @IBOutlet weak var titleForNotification: UILabel!
    @IBOutlet weak var baseVw: UIView!
    @IBOutlet weak var messageFromNotificatiom: UILabel!
    var view: DMNotificationView!
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }
    func xibSetup() {
        view = loadViewFromNib()

        view.frame = bounds

        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]

        addSubview(view)
        
    }
    
    func loadViewFromNib() -> DMNotificationView {

        let view = Bundle.main.loadNibNamed("DMNotificationView", owner: self, options: nil)?[0] as! DMNotificationView
        
        return view
    }
    
    convenience init(_ dictionary:NSDictionary) {
        let rect:CGRect = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.size.width)! - 40,height: 220);
        self.init(frame:rect)

    }
    
    func loadDatas(_ dictionary:NSDictionary)
    {
        view.titleForNotification.text = dictionary["google.c.a.c_l"] as? String;
        let message = dictionary.value(forKeyPath: "aps.alert") as? String
        view.messageFromNotificatiom.text = message;
        UserDefaults.standard.set(message, forKey: "notification")
        UserDefaults.standard.synchronize()
        view.layer.cornerRadius = 10;
        addShadow(baseView: view)
        
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
   
    
    @IBAction func didClickOnOKButton(_ sender: UIButton)
    {
        for view in (UIApplication.shared.keyWindow?.subviews)! {
            if view is DMNotificationView {
                 view.removeFromSuperview()
            }
        }
    }
    
}

