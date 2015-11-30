//
//  ScheduleViewController.swift
//  CIS380
//
//  Created by John Tunisi on 11/30/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pullToRefreshActivated(sender: UIRefreshControl) {
        sender.endRefreshing();
    }
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "showDetail" {
    //            if let indexPath = self.tableView.indexPathForSelectedRow {
    //                let object = objects[indexPath.row] as! Dictionary<String, AnyObject>
    //                let controller = segue.destinationViewController as! DetailViewController
    //                controller.detailItem = object
    //            }
    //        }
    //    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleCell", forIndexPath: indexPath)
        
        //        if let object = objects[indexPath.row] as? Dictionary<String, AnyObject> {
        //
        //        }
        return cell
    }
    
    
}