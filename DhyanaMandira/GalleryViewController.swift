//
//  GalleryViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 05/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationItem.title="Gallery"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCellId", for: indexPath as IndexPath) as! GalleryCollectionViewCell
        
        let indexLoc = indexPath.item + 1
        cell.ItemImage.image = UIImage(named: String(format: "image_%i.jpg",indexLoc))
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
                return 1
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 42
        
    }
   
    

}
