//
//  VisitViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 05/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VisitViewController: UIViewController {

    
    @IBOutlet weak var visitTextView: UITextView!
    @IBOutlet weak var MapView: MKMapView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\"><b>PostalAddress:</b><br>Rajkumar G<br>Mukhya Shikshaka<br>Dhyana Mandira Yoga Kendra<br>Shri Someshwara(Shiva) Temple,<br>Madiwala,<br>BTM 1st Stage,<br>Bangalore,<br>560068</p></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Visit"
        let center = CLLocationCoordinate2D(latitude:12.918235, longitude:77.618393)
        let region = MKCoordinateRegion(center: center, span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MapView.setRegion(region, animated: true)
        let annotation=MKPointAnnotation()
        annotation.coordinate=center;
        MapView.addAnnotation(annotation)
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        
        visitTextView.attributedText = attributedString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
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
