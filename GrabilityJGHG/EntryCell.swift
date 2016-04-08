//
//  EntryCell.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/4/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var right: UILabel!
    @IBOutlet weak var tag_view: UIView!
    @IBOutlet weak var name_tag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayData(entry : Entry?){
    
        
        //Font
        self.title?.font = UIFont(name: "Geometria", size: (self.title.font?.pointSize)!)
        self.right?.font = UIFont(name: "Eponymous", size: (self.right.font?.pointSize)!)
        
        var imgSrt : String!
        
        for current_img in (entry?.entry_imgs)! {
            if current_img.height == "100" {
                imgSrt = current_img.label
            }
        }
        
        self.img.sd_setImageWithURL(NSURL(string: imgSrt), placeholderImage: UIImage(named : "placeholder.png"))
        self.title.text = entry?.entry_name_label
        self.right.text = entry?.entry_rights_label
        
        self.tag_view.layer.cornerRadius = 10.0
        self.tag_view.clipsToBounds = true
        
        self.name_tag.font = UIFont(name: "Geometria", size: (self.name_tag?.font.pointSize)!)
        self.name_tag.text = entry?.entry_category_attr_label
    }
    
}
