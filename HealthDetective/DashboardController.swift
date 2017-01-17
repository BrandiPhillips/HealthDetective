//
//  DashboardController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit
import FirebaseAuth

class DashboardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // send logout notification to Firebase and return the user to the login screen:
    
    @IBAction func logoutHandler(_ sender: UIBarButtonItem) {
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                presentingViewController?.dismiss(animated: true, completion: nil)
            } catch let error {
                assertionFailure("Error signing out: \(error)")
            }
        }
        
    }
 
}
