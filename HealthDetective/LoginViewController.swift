//
//  LoginViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = FIRAuth.auth()?.currentUser {
            self.signedIn(user)
        }
        
    }

  
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else {return}
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.signedIn(user!)
        }
        
        let mainNavController = storyboard?.instantiateViewController(withIdentifier: "MainNavController") as! MainNavController
        present(mainNavController, animated: true, completion: nil) 
    }
    @IBAction func signUpTapped(_ sender: Any) {
        guard let email = emailField.text, let password = passwordField.text else { return}
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.setDisplayName(user!)
        }
    }

}
