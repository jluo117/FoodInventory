//
//  ViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var FoodName: UILabel!
    
    @IBOutlet weak var FoodCount: UILabel!
    
    @IBOutlet weak var Cost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
        FoodName.text = CurUser.UserItems[CurIndex].ItemName
        FoodCount.text = String(CurUser.UserItems[CurIndex].ItemCount)
        CurUser.UserItems[CurIndex].Cost = Int(arc4random_uniform(10))
        Cost.text = String(CurUser.UserItems[CurIndex].Cost)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Use(_ sender: UIButton) {
        CurUser.UserItems[CurIndex].takeFood()
        FoodCount.text = String(CurUser.UserItems[CurIndex].ItemCount)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

