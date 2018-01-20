//
//  ViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit
 var CurUser = User(UserName: "test")
var CurIndex = 0
class FoodTableViewController: UITableViewController {
    
    // MARK: Properties
    var hardcodedFood = ["Bananas", "Oranges"]

    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurUser.UserItems.count
   
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
       
        for userItem in CurUser.UserItems {
            cell.foodLabel.text = userItem.ItemName
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! FoodDetailViewController
        
        detailVC.foodName = hardcodedFood[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    // MARK: Action
    @IBAction func addPressed(_ sender: Any) {
        let addInventoryVC = storyboard?.instantiateViewController(withIdentifier: "addInventoryVC") as! Shop
        present(addInventoryVC, animated: true, completion: nil)
    }
    


}

