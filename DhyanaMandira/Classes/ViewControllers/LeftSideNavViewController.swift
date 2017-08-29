//
//  LeftSideNavViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 29/06/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//


import Foundation
import UIKit
import MessageUI

class LeftSideNavViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var headerTextView: UILabel!
    //var menuItems:[String] = ["About","Registration Formality"];
    
    var sectionHeaders:[String] = ["General","Yoga","Highlights","Contact Us"/*,"Share"*/]
    var generalArray:[String]=["About","Registration Formality","Upcoming Batches/Events"]
    var yogaArray:[String]=["Ashtanga Yoga-a path towards ultimate","Dhyana Mandira-a platform to transform","Yogabhyasa Prakriyas","Mantras"]
    var highlightsArray:[String]=["Founder","Gallery","Videos","Comments received"]
    var contactUsArray:[String]=["E-Mail","Call","Visit","Like us in facebook"]
    //var shareArray:[String]=["Share this app"]
    
    /*var names=["General":["About","Registration Formality","Upcoming Batches/Events"],"Yoga":["Ashtanga Yoga-a path towards ultimate","Dhyana Mandira-a platform to transform","Yogabhyasa Prakriyas","Mantras"],"Highlights":["Founder","Gallery","Comments received"],"Contact Us":["E-Mail","Call","Visit","Like us in facebook"],"Share":["Share this app"]]*/
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : [String]!
    }
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectArray.append(Objects(sectionName: sectionHeaders[0],sectionObjects: generalArray))
        objectArray.append(Objects(sectionName: sectionHeaders[1],sectionObjects: yogaArray))
        objectArray.append(Objects(sectionName: sectionHeaders[2],sectionObjects: highlightsArray))
        objectArray.append(Objects(sectionName: sectionHeaders[3],sectionObjects: contactUsArray))
        //objectArray.append(Objects(sectionName: sectionHeaders[4],sectionObjects: shareArray))
        /*for(key,value) in names {
            objectArray.append(Objects(sectionName: key,sectionObjects:value))
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count;
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItem = tableView.dequeueReusableCell(withIdentifier: "MenuItemLayout",for: indexPath) as! NavigationDrawerMenuItemTableViewCell
        menuItem.MenuItemLabel.text=objectArray[indexPath.section].sectionObjects[indexPath.row]
        if indexPath.section==0 {
            if indexPath.row == 0 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_info_outline.png")
            }
            else if indexPath.row == 1 {
                menuItem.MenuImageView.image=#imageLiteral(resourceName: "ic_action_attach_money.png")
            }
            else if indexPath.row == 2 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_event_note.png")
            }
            
        } else if indexPath.section==1 {
            if indexPath.row == 0 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_ashtanga_yoga.png")
            }
            else if indexPath.row == 1 {
                menuItem.MenuImageView.image=#imageLiteral(resourceName: "ic_action_dhyana.png")
            }
            else if indexPath.row == 2 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_abhyasas.png")
            }
            else if indexPath.row == 3 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_aum_mantra_symbol.png")
            }
        } else if indexPath.section==2 {
            if indexPath.row == 0 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_person_outline.png")
            }
            else if indexPath.row == 1 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_collections.png")
            }
            else if indexPath.row == 2 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_ondemand_video")
            }
            else if indexPath.row == 3 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_insert_comment.png")
            }
        } else if indexPath.section==3 {
            if indexPath.row == 0 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_contact_mail.png")
            }
            else if indexPath.row == 1 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_contact_phone.png")
            }
            else if indexPath.row == 2 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_directions_walk.png")
            }
            else if indexPath.row == 3 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_thumb_up.png")
            }
        } else if indexPath.section==4 {
            if indexPath.row == 0 {
                menuItem.MenuImageView.image = #imageLiteral(resourceName: "ic_action_share.png")
            }
        }        
        return menuItem;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.section)
        {
            case 0:
                if(indexPath.row == 0) {
            let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let centerNavController = UINavigationController(rootViewController: centerViewController)
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer!.centerViewController = centerNavController
            appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                }
                if(indexPath.row == 1) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)

                }
                if(indexPath.row == 2) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventsViewController") as! EventsViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }

            break;
            case 1:
                if(indexPath.row == 0) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "AshtangaViewController") as! AshtangaViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                }
                if(indexPath.row == 1) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "DhyanaMandiraViewController") as! DhyanaMandiraViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }
                if(indexPath.row == 2) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "AbhyasaViewController") as! AbhyasaViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }
                if(indexPath.row == 3) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "MantrasViewController") as! MantrasViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }
                if(indexPath.row == 2) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "AbhyasaViewController") as! AbhyasaViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }
                if(indexPath.row == 3) {
                    let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "MantrasViewController") as! MantrasViewController
                    let centerNavController = UINavigationController(rootViewController: centerViewController)
                    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.centerContainer!.centerViewController = centerNavController
                    appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
                    
                }
            break;
        case 2:
            if(indexPath.row == 0) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "FounderViewController") as! FounderViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 1) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 2) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "YouTubeViewController") as! YouTubeViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 3) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            break;
        case 3:
            if(indexPath.row == 0) {
                let mailComposeViewController = configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }
            }
            if(indexPath.row == 1) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "CallViewController") as! CallViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 2) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VisitViewController") as! VisitViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 3) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "FacebookViewController") as! FacebookViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            if(indexPath.row == 3) {
                let centerViewController = self.storyboard?.instantiateViewController(withIdentifier: "FacebookViewController") as! FacebookViewController
                let centerNavController = UINavigationController(rootViewController: centerViewController)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.centerContainer!.centerViewController = centerNavController
                appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
            }
            break;
            
        default:
            break;
        }
    }

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["rajkumargour10@gmail.com"])
        mailComposerVC.setCcRecipients(["rajayogamadiwala@gmail.com"])
        mailComposerVC.setSubject("DhyanaMandira :: Contact Us")
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
