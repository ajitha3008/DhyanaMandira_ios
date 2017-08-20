//
//  CommentsViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class CommentsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var TableData:NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Comments"
        //get_data_from_url(url: "http://www.kaleidosblog.com/tutorial/tutorial.json")
        
        getComments()
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
    }

    
    func getComments()
    {
        AppDelegate.init().showLoader()
        HTTPNetworker.sharedInstance.get_data_from_url(urlStr: Constants.GoogleSheetURL.CommentsURL) { (JSON, error) in
            AppDelegate.init().hideLoader()
            if(error == nil)
            {
                let rows:NSArray! = (JSON as AnyObject).value(forKeyPath: "table.rows") as! NSArray
                print(rows)
                
                for var i in (0..<rows.count)
                {
                    self.TableData.add(rows[i]);
                
                }
                
                print(self.TableData)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                    return
                })
            }else
            {
                
            }
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCommentsCell", for: indexPath) as! UserCommentsTableViewCell
        let dataAry:NSArray! = (self.TableData.object(at: indexPath.row) as AnyObject).value(forKey: "c") as! NSArray;
        let name : String! = (dataAry.object(at: 1) as AnyObject).value(forKey: "v") as! String
        let comment : String! = (dataAry.object(at: 2) as AnyObject).value(forKey: "v") as! String
        let rating : Float! = (dataAry.object(at: 0) as AnyObject).value(forKey: "v") as! Float
        cell.nameLabel.text = name
        cell.commentsLabel.text = comment
        cell.configureRating(rating: rating);
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 100;
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
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
