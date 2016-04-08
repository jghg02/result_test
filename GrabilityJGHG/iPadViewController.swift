//
//  iPadViewController.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/6/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class iPadViewController: MainViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var loader: Loader!
    var all_data : [Entry]? = []
    var item_selected : Entry?
    
    var detailsViewController : DetailViewController!
    
    //Anim
    let animation = PresentationAnim()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Register nib
        self.collectionView.registerNib(UINib(nibName: "iPadEntryCell", bundle: nil), forCellWithReuseIdentifier: "iPadEntryCell")
        
        
        self.loader = Loader(view: self.view)
        self.loader.actionText = "Loading"
        self.loader.showInView()
        
        //Getting all Info
        GrabilityServices.gettingAllData { (data , error) -> Void in
            NSLog("Getting.... \(data)")
            if error == nil && data != nil {
                NSLog("EXISTE DATA")
                self.all_data = data
                self.collectionView.reloadData()
                self.loader.removeFromView()
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /// MARK: - Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            self.detailsViewController = segue.destinationViewController as! DetailViewController
            self.detailsViewController.current_product = self.item_selected
            self.detailsViewController.transitioningDelegate = self
            
        }
    }
    
    /// MARK: - UICollectionView Methods 
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.all_data?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("iPadEntryCell", forIndexPath: indexPath) as? iPadEntryCell
        
        cell?.displayData(self.all_data![indexPath.row])
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSLog("Selected \(self.all_data![indexPath.row].entry_name_label)")
        print("\(indexPath.row)")
        self.item_selected = self.all_data![indexPath.row]
        self.performSegueWithIdentifier("detail", sender: self)
    }
    

    /// MARK: -Animation Methods
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animation
    }


}
