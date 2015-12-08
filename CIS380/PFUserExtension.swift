//
//  PFUserExtension.swift
//  CIS380
//
//  Created by John Tunisi on 12/8/15.
//  Copyright © 2015 John Tunisi. All rights reserved.
//

import Parse

var restaurantID: String = ""

extension PFUser {
    
    func getRestaurantID() -> String {
        if restaurantID != "" {
            return restaurantID
        }

        do {
            let object: PFObject = try PFUser.currentUser()!.fetch()
            restaurantID = object["restaurantID"] as! String
        } catch {
        }
        return restaurantID
    }
    
    func setRestaurantID(restaurantID: String) {
        PFUser.currentUser()?.setValue(restaurantID, forKey: "restaurantID")
        PFUser.currentUser()?.saveEventually()
    }
}