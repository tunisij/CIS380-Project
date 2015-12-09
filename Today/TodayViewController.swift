//
//  TodayViewController.swift
//  Today
//
//  Created by John Tunisi on 12/8/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import UIKit
import NotificationCenter
import Parse

class TodayViewController: UIViewController, NCWidgetProviding {
   
    @IBOutlet weak var todaysWorkLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parse.enableDataSharingWithApplicationGroupIdentifier("group.edu.gvsu.CIS380", containingApplication: "edu.gvsu.CIS380")
        Parse.setApplicationId("ftX8JKp5X2DtMHImZAcpD2r5J40BdHfRk9eI4Tm6", clientKey: "GuxzF9zCpjYvold58ukOvm9Ja39KVsMbscWzVX7e")
        
        loadSchedule()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        Parse.enableDataSharingWithApplicationGroupIdentifier("group.edu.gvsu.CIS380", containingApplication: "edu.gvsu.CIS380");
        Parse.setApplicationId("ftX8JKp5X2DtMHImZAcpD2r5J40BdHfRk9eI4Tm6", clientKey: "GuxzF9zCpjYvold58ukOvm9Ja39KVsMbscWzVX7e")

        completionHandler(NCUpdateResult.NewData)
    }
    
    func loadSchedule() {
        let query = PFQuery(className: "employee")
        query.whereKey("username", equalTo: (PFUser.currentUser()?.username)!)
        
        do {
            let objects = try query.findObjects()
            for object in objects {
                let today = NSDate()
                let pf = object["Date"] as! PFObject
                if NSDate() == object["Date"] as! PFObject {
                    self.todaysWorkLabel.text = "AM: PM: "
                }
            }
        } catch {
            
        }
    }
}
