//
//  GrabilityServices.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/1/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

var _operationManager : AFHTTPRequestOperationManager?
var _operationManagerSafe : AFHTTPRequestOperationManager?

class GrabilityServices: NSObject {
    


    class func operationMangerSafe() -> AFHTTPRequestOperationManager {
        
        if _operationManagerSafe == nil {
            _operationManagerSafe = AFHTTPRequestOperationManager(baseURL: NSURL(string: BASE_URL_2))
            _operationManagerSafe?.responseSerializer = AFJSONResponseSerializer()
            _operationManagerSafe?.securityPolicy.allowInvalidCertificates = true
        }
        
        return _operationManagerSafe!
    }
    
    
    /**
     Getting all Entries from WebServices
     
     Return: 
        - [Entry]?: An Array with all Entries
        - NSError: A message when an error occurs
     
    */
    
    class func gettingAllData(callback : ([Entry]?, NSError?) -> Void ) -> AFHTTPRequestOperation {

        let operation = GrabilityServices.operationMangerSafe().GET(BASE_URL, parameters: nil, success: { (operation, response) -> Void in

            let data = response as! NSDictionary
            
            if data.count != 0  {
                print("The items...")
                
                //Getting all Object Feed
                let feeds = data.objectForKey("feed") as! NSDictionary
                
                //Getting all Objects Entry
                let entry_data = feeds.objectForKey("entry") as! NSArray
                
                print("\(entry_data.count)")
                
                var tmp : [Entry] = []
                
                for dictionary in entry_data as! [NSDictionary] {
                    tmp.append(Entry(dictionary: dictionary))
                }
                callback(tmp, nil)
            } else {
                print("No items...")
                callback(nil, NSError(domain: "GrabilityJGHG", code: -1, userInfo: nil))
            }
            
            
            
            }, failure: { (operation, error) -> Void in
                NSLog("Error...")
        })
        
        return operation
    }
    

}
