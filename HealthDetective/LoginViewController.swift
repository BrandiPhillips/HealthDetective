//
//  LoginViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func loginTapped(_ sender: UIButton) {
        let mainNavController = storyboard?.instantiateViewController(withIdentifier: "MainNavController") as! MainNavController
        present(mainNavController, animated: true, completion: nil) 
    }

}
