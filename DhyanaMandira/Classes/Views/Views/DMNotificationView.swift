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
    var view: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }

    func notificationViewSetup(data:NSDictionary)-> UIView
    {
        nibSetup()
        
        self.titleForNotification.text = data.value(forKey: "") as! String;
        self.messageFromNotificatiom.text = data.value(forKey: "") as! String;
        
        return view;
    }
    
    @IBAction func didClickOnOKButton(_ sender: UIButton)
    {
        view.removeFromSuperview()
        self.removeFromSuperview()
    }
    
}
