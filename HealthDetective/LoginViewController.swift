//
//  LoginViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets:
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    // after view is loaded check to see if the user is signed in:
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = FIRAuth.auth()?.currentUser {
            self.signIn()
        }
    }
    
    // MARK: Delegate Methods
    
    // Hide keyboard when done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

  // MARK: Actions:
    // send user information to Firebase for authentication:
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let email = emailField.text
        let password = passwordField.text
        FIRAuth.auth()?.signIn(withEmail: email!, password: password!, completion: { (user, error) in
            guard let _ = user else {
                    if let error = error {
                        if let errCode = FIRAuthErrorCode(rawValue: error._code) {
                            switch errCode {
                                case .errorCodeUserNotFound:
                                    self.showAlert("User account not found.  Please SignUp")
                                case .errorCodeWrongPassword:
                                    self.showAlert("Incorrect username/password combination")
                                default:
                                    // for developement purposes...
                                self.showAlert("Error: \(error.localizedDescription)")
                            }
                        }
                        return
                    }
               assertionFailure("User and error are nil")
            return
            }
            self.signIn()
        })
        
    }
        
    
    @IBAction func signUpTapped(_ sender: Any) {
//        guard let email = emailField.text, let password = passwordField.text else { return}
//        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            
//        }
    }
    
    // send a request to Firebase for password reset, an alert box will pop up for user to indicate what email address to send request to:
    
    @IBAction func passwordAssistanceTapped(_ sender: Any) {
        let prompt = UIAlertController(title: "Health Detective", message: "Email:", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            let userInput = prompt.textFields![0].text
            if (userInput!.isEmpty) {
                return
            }
            FIRAuth.auth()?.sendPasswordReset(withEmail: userInput!, completion: { (error) in
                if let error = error {
                    if let errCode = FIRAuthErrorCode(rawValue: error._code) {
                        switch errCode {
                        case .errorCodeUserNotFound:
                            DispatchQueue.main.async {
                                self.showAlert("User account not found. Please SignUp")
                            }
                        default:
                            DispatchQueue.main.async {
                                self.showAlert("Error: \(error.localizedDescription)")
                            }
                        }
                    }
                    return
                } else {
                    DispatchQueue.main.async {
                        self.showAlert("You'll receive an email shortly to reset your password.")
                    }
                }
            })
        }
        prompt.addTextField(configurationHandler: nil)
        prompt.addAction(okAction)
        present(prompt, animated: true, completion: nil)
    }
    
    // Alert method
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Health Detective", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // if signed in go to dashboard
    func signIn() {
        let mainNavController = storyboard?.instantiateViewController(withIdentifier: "MainNavController") as! MainNavController
        present(mainNavController, animated: true, completion: nil)
        
    }
    

}
