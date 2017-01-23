//
//  SymptomEntryViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/19/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit
import Firebase

class SymptomEntryViewController: UIViewController, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate, DatePicker {
    
    
    //MARK: Properties:
    var date = ""
    var ref: FIRDatabaseReference!
    var user: FIRUser!
    
    
    //MARK: Outlets:
    @IBOutlet weak var symptomName: UITextField!
    @IBOutlet weak var symptomDate: UIButton!
    @IBOutlet weak var symptomDetails: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Symptom Entry"
        symptomDetails.layer.cornerRadius = 10
        symptomName.delegate = self
        user = FIRAuth.auth()?.currentUser
    }

    
    
    @IBAction func recordEntry(_ sender: Any) {
        let name = symptomName.text!
        let details = symptomDetails.text!
        let date = self.date
       
        let ref = FIRDatabase.database().reference()
        let newSymRef = ref.child("users/\(self.user.uid)/symptoms").childByAutoId()
      let symptom = ["symptomName": name, "symptomDetails": details, "symptomDate": date]
        
        newSymRef.setValue(symptom)
        
        
    }
    
    
    func setSelectedDate(selectedDate: String) {
        date = selectedDate
        symptomDate.setTitle(date, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "datePickerSym" {
            let datePickerViewController: DatePickerViewController = segue.destination as! DatePickerViewController
            datePickerViewController.delegate = self
        }
    }

}
