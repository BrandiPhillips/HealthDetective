//
//  IngredientsViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/19/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    @IBOutlet weak var foodList: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodList.layer.cornerRadius = 10 
    
    }

 
    @IBAction func dismissPopover(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
