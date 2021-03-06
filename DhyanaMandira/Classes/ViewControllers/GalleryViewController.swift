//
//  GalleryViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 05/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class GalleryViewController: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    @IBOutlet weak var hyperlink: UILabel!
    @IBOutlet weak var BaseView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.title="Gallery"
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
        tapGesture.numberOfTapsRequired = 1
        hyperlink.isUserInteractionEnabled =  true
        hyperlink.addGestureRecognizer(tapGesture)
        
        self.setupLeftMenuButton()
        self.addShadow(baseView: BaseView)
    }

    func tapResponse(recognizer: UITapGestureRecognizer) {
        let url = URL(string: "https://plus.google.com/104001892080880835190/posts")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func LeftSideButtonTapped(_ sender: Any) {
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
//    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCellId", for: indexPath as IndexPath) as! GalleryCollectionViewCell
        
        let indexLoc = indexPath.item + 1
        cell.ItemImage.image = UIImage(named: String(format: "image_%i.jpg",indexLoc))
        cell.ItemLabel.text = getName(name: String(format: "image_%i",indexLoc))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let indexLoc = indexPath.item + 1
        
        let imageView = UIImageView(image: UIImage(named: String(format: "image_%i.jpg",indexLoc)))
        //imageView.frame = self.view.frame
        imageView.center = self.view.center
        imageView.frame = CGRect(x : 0, y : 0,width : (self.view.frame.size.width), height : (self.view.frame.size.height));
        imageView.backgroundColor = .white
        imageView.contentMode = .top
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        self.navigationItem.title=getName(name: String(format: "image_%i",indexLoc))
        self.view.addSubview(imageView)
    }
    
    // Use to back from full mode
    func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
        self.navigationItem.title="Gallery"
    }
    
    func getName(name: String) -> String {
        if name == "image_1" {
            return "Meditation@Lalbaugh";
        } else if name == "image_2" {
            return "FunGames1";
        } else if name == "image_3" {
            return "Gomaatha Pooja";
        } else if name == "image_4" {
            return "Meditation@Lalbaugh1";
        } else if name == "image_5" {
            return "Independence Day Celebration1";
        } else if name == "image_6" {
            return "Independence Day Celebration2";
        } else if name == "image_7" {
            return "Independence Day Celebration3";
        } else if name == "image_8" {
            return "Independence Day Celebration4";
        } else if name == "image_9" {
            return "Moon light dinner";
        } else if name == "image_10" {
            return "Mud bath1";
        } else if name == "image_11" {
            return "Mud bath2";
        } else if name == "image_12" {
            return "Nature meditation";
        } else if name == "image_13" {
            return "Nature meditation1";
        } else if name == "image_14" {
            return "New batch inauguration";
        } else if name == "image_15" {
            return "New batch inauguration2";
        } else if name == "image_16" {
            return "Ragi ball food";
        } else if name == "image_17" {
            return "Rakshabandhana";
        } else if name == "image_18" {
            return "Raw food1";
        } else if name == "image_19" {
            return "Sahabhojana1";
        } else if name == "image_20" {
            return "Sahabhojana2";
        } else if name == "image_21" {
            return "Sahabhojana";
        } else if name == "image_22" {
            return "Spiritual picnic2";
        } else if name == "image_23" {
            return "Spritual Picnic";
        } else if name == "image_24" {
            return "Sun Rise Veekshane";
        } else if name == "image_25" {
            return "SuryaNamaskara1";
        } else if name == "image_26" {
            return "Swacchata Service";
        } else if name == "image_27" {
            return "Swamy Vivekananda Jayanthi";
        } else if name == "image_28" {
            return "Therapy1";
        } else if name == "image_29" {
            return "Therapy1";
        } else if name == "image_30" {
            return "Sakleshpur train trip";
        } else if name == "image_31" {
            return "Trekking";
        } else if name == "image_32" {
            return "Trekking1";
        } else if name == "image_33" {
            return "Trekking2";
        } else if name == "image_34" {
            return "Trekking3";
        } else if name == "image_35" {
            return "Trekking4";
        } else if name == "image_36" {
            return "Trekking5";
        } else if name == "image_37" {
            return "With Orphans";
        } else if name == "image_38" {
            return "Yoga family Tour1";
        } else if name == "image_39" {
            return "Yoga family Tour2";
        } else if name == "image_40" {
            return "Yoga family Tour3";
        } else if name == "image_41" {
            return "Yoga family Tour4";
        } else if name == "image_42" {
            return "Yogi as a farmer";
        } else {
            return "Image";
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
                return 1
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 42
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: BaseView.frame.size.width/2-10, height: BaseView.frame.size.width/2-10)
    }

}
