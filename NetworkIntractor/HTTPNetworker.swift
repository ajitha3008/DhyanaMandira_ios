//
//  HTTPNetworker.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 14/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit


class HTTPNetworker: NSObject {
    
    class var sharedInstance: HTTPNetworker {
        struct Static {
            static let instance: HTTPNetworker = HTTPNetworker()
        }
        return Static.instance
    }
    
    
    func get_data_from_url(urlStr:String! , completionHandler: @escaping (Any?, Error?) -> Swift.Void)
    {
      
        //check network availability
        let urlRequest = URLRequest(url: URL(string: urlStr)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) in
          //  ARSLineProgress.hide()
            if error != nil {
                print(error!)
                 completionHandler(nil,error);
            } else {
                do {
                    let dataString = String(data: data!, encoding: String.Encoding.utf8)
                    guard let updatedStartIndex = dataString?.characters.index(of: "{") else { return }
                    //let updatedStartIndex = data.distance(from: index, to: data.endIndex)
                    let updatedEndIndex = dataString!.index(dataString!.endIndex, offsetBy: -2)
                    let substring = dataString!.substring(with: updatedStartIndex..<updatedEndIndex)
                    
                    do {
                        let JSON = self.convertToDictionary(text: substring );
                        
                        print(JSON!)

                        completionHandler(JSON,nil);
                        
                    } catch {
                        print(error)
                         completionHandler(nil,error);
                    }
                }
            }
        
        }
        
        task.resume()
    }
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

}
