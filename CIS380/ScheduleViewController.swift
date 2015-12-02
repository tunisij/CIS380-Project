//
//  ScheduleViewController.swift
//  CIS380
//
//  Created by John Tunisi on 11/30/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit
import Parse

class ScheduleViewController: UITableViewController {
    
    var scheduleArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        loadSchedule()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func refreshTable(sender: UIRefreshControl) {
        loadSchedule()
        sender.endRefreshing()
    }
    
    
    func loadSchedule() {
        let query = PFQuery(className:"employee")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                if let objects = objects {
                    self.scheduleArray.removeAll()
                    for object in objects {
                        var instance = Dictionary<String, String>()
                        instance["URL"] = object["URL"] as? String
                        instance["AM"] = object["AM"] as? String
                        instance["PM"] = object["PM"] as? String
                        instance["NAME"] = object["NAME"] as? String
                        
                        self.scheduleArray.append(instance)
                        self.tableView.reloadData()
                    }
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleCell", forIndexPath: indexPath) as! ScheduleTableCell
        
            if let object = scheduleArray[indexPath.row] as? Dictionary<String, String> {
//                if let url = NSURL(string: object["URL"]!) {
//                    if let data = NSData(contentsOfURL: url) {
//                        cell.imageLabel.image = UIImage(data: data)
//                    }        
//                }
                cell.name!.text = object["NAME"]
                cell.timeAM!.text = object["AM"]
                cell.timePM!.text = object["PM"]
            }
        
        return cell
    }
    
    
}