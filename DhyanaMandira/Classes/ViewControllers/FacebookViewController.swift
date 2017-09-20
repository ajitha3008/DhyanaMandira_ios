//
//  FacebookViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKCoreKit

class FacebookViewController: BaseViewController {
    @IBOutlet weak var FBlikeView: UIView!
    @IBOutlet weak var FBShareView: UIView!
    @IBOutlet weak var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Like & Share"
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
        self.initilizeFBViews()
    }
    
    func initilizeFBViews()
    {
        self.fbLikeSetup()
        self.fbShareSetup()
        addShadow(baseView: baseView)
    }
    
    func fbLikeSetup()
    {
        let likeBtn:FBSDKLikeControl! = FBSDKLikeControl(frame: CGRect(x: 0, y: 0, width: self.FBlikeView.frame.size.width, height: self.FBlikeView.frame.size.height))
        likeBtn.objectID = "https://www.facebook.com/DhyanaMandiraSomeshwaraTemple"
        likeBtn.likeControlStyle = FBSDKLikeControlStyle.boxCount
        likeBtn.likeControlHorizontalAlignment = FBSDKLikeControlHorizontalAlignment.right
        self.FBlikeView.addSubview(likeBtn)
    }
    func fbShareSetup()
    {
        let content:FBSDKShareLinkContent! = FBSDKShareLinkContent();
        content.contentURL = URL(string: "https://www.facebook.com/DhyanaMandiraSomeshwaraTemple");
        let shareBtn:FBSDKShareButton! = FBSDKShareButton(frame: CGRect(x: 0, y: 0, width: self.FBShareView.frame.size.width, height: self.FBShareView.frame.size.height))
        shareBtn.shareContent = content
        self.FBShareView.addSubview(shareBtn)
    }

}
