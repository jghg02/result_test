//
//  iPadEntryCell.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/6/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class iPadEntryCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var right_label: UILabel!
    @IBOutlet weak var tag_view: UIView!
    @IBOutlet weak var name_tag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayData(entry : Entry?){
        
        var imgSrt : String!
        
        for current_img in (entry?.entry_imgs)! {
            if current_img.height == "100" {
                imgSrt = current_img.label
            }
        }
        
        self.img.sd_setImageWithURL(NSURL(string: imgSrt), placeholderImage: UIImage(named : "placeholder.png"))
        
        //Font
        self.label_name?.font = UIFont(name: "Geometria", size: (self.label_name.font?.pointSize)!)
        self.right_label?.font = UIFont(name: "Geometria", size: (self.right_label?.font?.pointSize)!)
        
        self.label_name?.text = entry?.entry_name_label
        self.right_label?.text = entry?.entry_rights_label
        
        self.tag_view.layer.cornerRadius = 10.0
        self.tag_view.clipsToBounds = true
        
        
        self.name_tag.font = UIFont(name: "Geometria", size: (self.name_tag?.font.pointSize)!)
        self.name_tag.text = entry?.entry_category_attr_label
        
    }

}
