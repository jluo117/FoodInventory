//
//  FoodDetailViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/20/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    // MARK: Properties
    var foodName: String!
    
    @IBOutlet weak var Remaining: UILabel!
    // MARK: Outlets

    @IBOutlet weak var Cost: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationItem.title = foodName
        Remaining.text = String(CurUser.UserItems[CurIndex].ItemCount)
        Cost.text = String(CurUser.UserItems[CurIndex].Cost)
    }
    
    // MARK: Action
    @IBAction func buyPressed(_ sender: Any) {
        let addInventoryVC = storyboard?.instantiateViewController(withIdentifier: "addInventoryVC") as! Shop
        present(addInventoryVC, animated: true, completion: nil)
    }
    
}
