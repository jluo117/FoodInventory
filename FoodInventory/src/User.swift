//
//  User.swift
//  FoodInventory
//
//  Created by james luo on 1/20/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import Foundation
import Firebase
class User{
    var UserItems = [UserItem]()
    var UserName: String
    init(UserName: String){
        self.UserName = UserName
        var ref = Database.database().reference()
        ref.child("UserData").child("TestUser").observeSingleEvent(of: .value, with: {snapShot in
            // Get user value
            let value = snapShot.value as? NSDictionary
            let userInfo = value?["UserName"] as? String ?? ""
            self.UserName = userInfo
        })
        ref.child("UserData").child("TestUser").child("food").observe(.value) { snapshot in
            for child in (snapshot.children.allObjects as? [DataSnapshot])! {
                print(child.value)
                let value = child.value as! NSDictionary
                let foodName = value["name"] as? String ?? ""
                let warning = value["WarningNumber"] as? Int ?? 0
                let amount = value["amount"] as? Int ?? 0
                let loadedItem = UserItem(ItemName: foodName, WarningNumber: warning)
                loadedItem.ItemCount = amount
                self.UserItems.append(loadedItem)
            }
        }
    }
}
