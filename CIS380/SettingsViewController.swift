//
//  SettingsViewController.swift
//  CIS380
//
//  Created by John Tunisi on 11/30/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import Parse

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        username.text = PFUser.currentUser()?.username
    }
    
    @IBAction func logoutButton(sender: UIButton) {
        PFUser.logOut()
        let homeViewController = HomeViewController()
        self.presentViewController(homeViewController, animated: true, completion: nil)
    }
    
}
