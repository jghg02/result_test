//
//  Feed.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/1/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import Foundation

/// Data Model

class Entry {
    
    var author_name : String?
    var author_uir : String?
    var entry_name_label : String?
    var entry_imgs : [Img]? = []
    var entry_summary : String?
    var entry_price_label : String?
    var entry_price_attr_amount : String?
    var entry_proce_attr_currency : String?
    var entry_contentType_attr_term : String?
    var entry_contentType_attr_label : String?
    var entry_rights_label : String?
    var entry_title_label : String?
    var entry_link_attributes_rel : String?
    var entry_link_attributes_type : String?
    var entry_link_attributes_href : String?
    var entry_id_label : String?
    var entry_attr_id : String?
    var entry_attr_bundleId : String?
    var entry_artist_label : String?
    var entry_attr_href : String?
    var entry_category_attr_id : String?
    var entry_category_attr_term : String?
    var entry_category_attr_scheme : String?
    var entry_category_attr_label : String?
    var entry_releaseDate_label : String?
    var entry_releaseDate_attr_label : String?
    
    
    /**
     Initializes a new Entry
     
     Parameters:
      - dictionary:
     
     Returns: A beautiful, brand-new entry.
     */
    
    init(dictionary : NSDictionary){
        
        let name = dictionary.objectForKey("im:name") as? NSDictionary
        self.entry_name_label = name?.objectForKey("label") as? String

        let img = dictionary.objectForKey("im:image") as? NSArray
        for current in img as! [NSDictionary] {
            self.entry_imgs?.append(Img(dictionary: current))
        }
        
        self.entry_summary = dictionary.objectForKey("summary")?.objectForKey("label") as? String
        
        self.entry_price_label = dictionary.objectForKey("im:price")?.objectForKey("label") as? String
        self.entry_price_attr_amount = dictionary.objectForKey("im:price")?.objectForKey("attributes")?.objectForKey("amount") as? String
        self.entry_proce_attr_currency = dictionary.objectForKey("im:price")?.objectForKey("attributes")?.objectForKey("currency") as? String
        
        self.entry_contentType_attr_term = dictionary.objectForKey("im:contentType")?.objectForKey("attributes")?.objectForKey("term") as? String
        self.entry_contentType_attr_label = dictionary.objectForKey("im:contentType")?.objectForKey("attributes")?.objectForKey("label") as? String
        
        self.entry_rights_label = dictionary.objectForKey("rights")?.objectForKey("label") as? String
        
        self.entry_title_label = dictionary.objectForKey("title")?.objectForKey("label") as? String
        
        self.entry_link_attributes_rel = dictionary.objectForKey("link")?.objectForKey("attributes")?.objectForKey("rel") as? String
        self.entry_link_attributes_type = dictionary.objectForKey("link")?.objectForKey("attributes")?.objectForKey("type") as? String
        self.entry_link_attributes_href = dictionary.objectForKey("link")?.objectForKey("attributes")?.objectForKey("href") as? String
        
        //id
        self.entry_id_label = dictionary.objectForKey("id")?.objectForKey("label") as? String
        
        self.entry_category_attr_label = dictionary.objectForKey("category")?.objectForKey("attributes")?.objectForKey("term") as? String
    }
    

}
