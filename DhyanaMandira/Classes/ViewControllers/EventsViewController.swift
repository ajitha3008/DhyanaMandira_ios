//
//  EventsViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import SVProgressHUD

class EventsViewController: BaseViewController {

    @IBOutlet weak var tableVW: UITableView!
    var events:NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Events"
        self.setupLeftMenuButton()
        // Do any additional setup after loading the view.
        self.GetEvents()
    }
    func GetEvents()
    {
        AppDelegate.init().showLoader()
            HTTPNetworker.sharedInstance.get_data_from_url(urlStr: Constants.GoogleSheetURL.EventURL) { (JSON, error) in
                AppDelegate.init().hideLoader()
                if(error == nil)
                {
                    let rows:NSArray! = (JSON as AnyObject).value(forKeyPath: "table.rows") as! NSArray
                    print(rows)
                    
                    for var i in (0..<rows.count)
                    {
                        if(i != 0)
                        {
                            self.events.add(rows[i]);
                        }
                    }
                    
                     print(self.events)
                    DispatchQueue.main.async(execute: {
                        self.tableVW.reloadData()
                        return
                    })
                }else
                {
                    let code = (error! as NSError).code
                    var message = error?.localizedDescription;
                   // print("error === %@",error?.localizedDescription ?? "Please check your internet");
                   if(code == -1009)
                   {
                    message = String(format:"\(message!) Please connect to internet and try again later.");
                    
                }
                    DispatchQueue.main.async(execute: {
                    let alert : UIAlertView! = UIAlertView(title:nil, message: message, delegate: nil, cancelButtonTitle: "Ok");
                    alert.show()
                          })
                }
        }
    }

}


extension EventsViewController:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EventsCell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventsCell
        let dataAry:NSArray! = (self.events.object(at: indexPath.row) as AnyObject).value(forKey: "c") as! NSArray;
        let name : String! = (dataAry.object(at: 0) as AnyObject).value(forKey: "v") as! String
        let location : String! = (dataAry.object(at:1) as AnyObject).value(forKey: "v") as! String
        let date : String! = (dataAry.object(at:2) as AnyObject).value(forKey: "v") as! String
        let desc : String! = (dataAry.object(at:3) as AnyObject).value(forKey: "v") as! String
        cell.eventName.text = name;
        cell.location.text = "Location : \(location!)"
        cell.dateAndTime.text = "Date : \(date!)"
        cell.eventDesc.text = "Description : \(desc!)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableVW.estimatedRowHeight = 100
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
}

