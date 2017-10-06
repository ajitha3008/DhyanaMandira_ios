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

class VisitViewController: BaseViewController, MKMapViewDelegate{

    
    @IBOutlet weak var BaseView: UIView!
    @IBOutlet weak var visitTextView: UITextView!
    @IBOutlet weak var MapView: MKMapView!
    
    let htmlString = "<html><body style=\"text-align:justify\"><p style=\"font-size:18px\"><b>PostalAddress:</b><br>Rajkumar G<br>Mukhya Shikshaka<br>Yoga Mandira<br>Shri Someshwara(Shiva) Temple,<br>Madiwala,<br>BTM 1st Stage,<br>Bangalore,<br>560068</p></body></Html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Visit"
        let center = CLLocationCoordinate2D(latitude:12.918235, longitude:77.618393)
        let region = MKCoordinateRegion(center: center, span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MapView.setRegion(region, animated: true)
        let maptitle = "Yoga Mandira"
        let mapSubTitle = "Shri Someshwara(Shiva) Temple"
        let annotation=MKPointAnnotation()
        annotation.coordinate=center;
        annotation.title = maptitle
        annotation.subtitle = mapSubTitle
        //MapView.addAnnotation(annotation)
        MapView.addAnnotation(MapPin(coordinate: center, title: maptitle, subtitle: mapSubTitle))
        MapView.showAnnotations(MapView.annotations, animated: true)
        MapView.delegate = self as? MKMapViewDelegate

        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)

        visitTextView.attributedText = attributedString
        self.addShadow(baseView: BaseView)
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        if control == view.rightCalloutAccessoryView {
        /*let url = URL(string: "http://maps.apple.com/?ll=12.918235,77.618393")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }*/
            let center = CLLocationCoordinate2D(latitude:12.918235, longitude:77.618393)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: center, addressDictionary:nil))
            mapItem.name = "Yoga Mandira"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation {return nil}
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.calloutOffset = CGPoint(x: -5, y: 5)
            let calloutButton = UIButton(type: .detailDisclosure)
            pinView!.rightCalloutAccessoryView = calloutButton
            pinView!.sizeToFit()
        }
        else {
            pinView!.annotation = annotation
        }
        
        
        return pinView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    @IBAction func LeftSideButtonTapped(_ sender: Any) {
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    class MapPin : NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String?
        var subtitle: String?
        
        init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
            self.coordinate = coordinate
            self.title = title
            self.subtitle = subtitle
        }
    }

}
