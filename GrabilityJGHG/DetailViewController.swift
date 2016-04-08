
//
//  DetailViewController.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/6/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class DetailViewController: MainViewController {

    
    var current_product : Entry?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var height_layout_img: NSLayoutConstraint!
    @IBOutlet weak var large_txt: UITextView!
    @IBOutlet weak var name_tag: UILabel!
    @IBOutlet weak var tag_view: UIView!
    @IBOutlet weak var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //change background color to back button
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        
        self.title = self.current_product?.entry_name_label
        
        self.displayData(self.current_product)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /// MARK: - Display Data
    func displayData(data : Entry?){
        self.name_label.font = UIFont(name: "Geometria", size: (self.name_label?.font.pointSize)!)
        
        self.name_label.text = "\(data!.entry_proce_attr_currency!)  \(data!.entry_price_attr_amount!)"
        
        var imgSrt : String!
        
        for current_img in (data?.entry_imgs)! {
            if current_img.height == "100" {
                imgSrt = current_img.label
            }
        }
        
        self.img.sd_setImageWithURL(NSURL(string: imgSrt), placeholderImage: UIImage(named : "placeholder.png"))
        
        self.large_txt.font = UIFont(name: "Eponymous", size: (self.large_txt?.font?.pointSize)!)
        self.large_txt.text = data?.entry_summary
        
        self.tag_view.layer.cornerRadius = 10.0
        self.tag_view.clipsToBounds = true
        
        
        self.name_tag.font = UIFont(name: "Geometria", size: (self.name_tag?.font.pointSize)!)
        self.name_tag.text = data?.entry_category_attr_label
        
        self.name.font = UIFont(name: "Geometria", size: (self.name?.font.pointSize)!)
        self.name.text = data?.entry_name_label
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickAppStore(sender: AnyObject) {
        
        NSLog("Link AppStore \(self.current_product!.entry_id_label)")
        UIApplication.sharedApplication().openURL(NSURL(string: "\(self.current_product!.entry_id_label!)")!)
    }
    

    @IBAction func onClickClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
