//
//  Image.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/1/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import Foundation

class Img {

    var label : String?
    var height : String?
    
    /**
     Initializes a new Image
     
     Parameters:
     - dictionary: Dictionary with all information about image
     
     Returns: A new Image Object (self)
     */
    init(dictionary : NSDictionary) {
        
        self.label = dictionary.objectForKey("label") as? String
        let attr = dictionary.objectForKey("attributes") as? NSDictionary
        self.height = attr?.objectForKey("height") as? String
        
    }
}
