//
//  item.swift
//  InventoryCounter
//
//  Created by james luo on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import Foundation
class UserItem{
    var ItemName :String
    var ItemCount = 0
    var Cost = 5
    var WarningNumber : Int
    init(ItemName: String , WarningNumber: Int) {
        self.ItemName = ItemName
        self.WarningNumber = WarningNumber

        
    }
    func add_serving()  {
        self.ItemCount += 1
    }
    func restock(Amount: Int)  {
        self.ItemCount += Amount
    }
    func  takeFood() {
        if (HaveFood()){
            self.ItemCount -= 1
        }
    }
    func HaveFood() -> Bool {
        if self.ItemCount < 1{
            return false
        }
        return true
    }
    func warning() -> Bool {
        if (self.ItemCount < self.WarningNumber){
            return true
        }
        return false
    }
}
