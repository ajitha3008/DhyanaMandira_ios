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
    
    var TableData:Array< String > = Array < String >()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Comments"
        //get_data_from_url(url: "http://www.kaleidosblog.com/tutorial/tutorial.json")
        
        get_data_from_url()
        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCommentsCell", for: indexPath) as! UserCommentsTableViewCell
        cell.nameLabel.text = "ajitha"
        cell.commentsLabel.text = TableData[indexPath.row]
        return cell
    }
    
    func get_data_from_url()
    {
   
        //check network availability
        let urlRequest = URLRequest(url: URL(string: "https://spreadsheets.google.com/tq?key=1JyIZM8QKG9rBGQBWNydv7472C12ZwoamT2UR6ymiikk")!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            self.extract_json(data: dataString!)
        }
        
        task.resume()
    }
    
    func extract_json(data:String)
    {
        guard let updatedStartIndex = data.characters.index(of: "{") else { return }
        //let updatedStartIndex = data.distance(from: index, to: data.endIndex)
        let updatedEndIndex = data.index(data.endIndex, offsetBy: -2)
        let substring = data.substring(with: updatedStartIndex..<updatedEndIndex)
        
        do {
            //converting resonse to NSDictionary
            /*var teamJSON: NSDictionary!
            
            teamJSON =  convertToDictionary(text: substring)! as NSDictionary

            let rowsArray: NSArray?   = teamJSON.object(forKey: "rows") as? NSArray;
            
            let text = String(describing: rowsArray?.count)*/
            //write parser & show progress
            TableData.append(substring)

        } catch {
            print(error)
        }
        do_table_refresh();
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func do_table_refresh()
    {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            return
        })
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
