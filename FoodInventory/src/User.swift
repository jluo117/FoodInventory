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
    }
}
