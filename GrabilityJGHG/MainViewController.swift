//
//  MainViewController.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/1/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImageView(image: UIImage(named: "icon.png"))
        logo.clipsToBounds = true;
        logo.contentMode = UIViewContentMode.ScaleAspectFit;
        
        var frame = logo.frame;
        frame.size.height = 33;
        frame.size.width = 40;
        
        logo.frame = frame;
        
        let logoContainer = UIView(frame: frame);
        logoContainer.addSubview(logo);
        
        self.navigationItem.titleView = logoContainer;
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
