//
//  ViewController.swift
//  GrabilityJGHG
//
//  Created by Josue Hernandez on 4/1/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

import UIKit

class ViewController: MainViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var myTable: UITableView!
    var loader: Loader!
    var all_data : [Entry]? = []
    var item_selected : Entry?
    
    var detailsViewController : DetailViewController!
    
    //Anim
    let animation = PresentationAnim()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        //Register nib
        self.myTable.registerNib(UINib(nibName: "EntryCell", bundle: nil), forCellReuseIdentifier: "EntryCell")
        
        self.loader = Loader(view: self.view)
        self.loader.actionText = "Loading..."
        self.loader.showInView()
        
        //Getting all Info
        GrabilityServices.gettingAllData { (data , error) -> Void in
            NSLog("Getting.... \(data)")
            if error == nil && data != nil {
                NSLog("EXISTE DATA")
                self.all_data = data
                self.myTable.reloadData()
                self.loader.removeFromView()
            } else {
                self.loader.removeFromView()
            }
            
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(true)
        NSLog("...Begin Animation....")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /// MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            self.detailsViewController = segue.destinationViewController as! DetailViewController
            self.detailsViewController.current_product = self.item_selected
            self.detailsViewController.transitioningDelegate = self
        }
    }
    

    /// MARK: UITableView Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.all_data?.count ?? 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EntryCell", forIndexPath: indexPath) as! EntryCell
        cell.displayData(self.all_data![indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("Selected \(self.all_data![indexPath.row].entry_name_label)")
        self.item_selected = self.all_data![indexPath.row]
        self.performSegueWithIdentifier("detail", sender: self)
    }
    


    /// MARK: -Animation Methods
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animation
    }

}

