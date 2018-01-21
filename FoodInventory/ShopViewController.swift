//
//  Shop.swift
//  InventoryCounter
//
//  Created by james luo on 1/20/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit

class Shop: UIViewController {
    var CartSize = 0

    @IBOutlet weak var Amount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        inCart.text = "0"
        Price.text = String(CurUser.UserItems[CurIndex].Cost)
        Cart.text = "0"
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Cart: UILabel! //Cart price
    @IBOutlet weak var inCart: UILabel!
    @IBAction func Buy(_ sender: UITouch) {
        CurUser.UserItems[CurIndex].restock(Amount: CartSize)
        CartSize = 0
        inCart.text = "0"
        Cart.text = "0"
        Stepper.value = 0
    }
    
    @IBAction func ItemEvent(_ sender: UIStepper) {
        CartSize = Int(sender.value)
        inCart.text = String(CartSize)
        Cart.text = String(CartSize * CurUser.UserItems[CurIndex].Cost)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */

}
