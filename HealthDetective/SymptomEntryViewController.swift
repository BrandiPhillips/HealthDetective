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

    
    // TODO: set this up to capture the data then send it to the sypmtom model controller:
    @IBAction func recordEntry(_ sender: Any) {
        let name = symptomName.text!
        let details = symptomDetails.text!
        let date = self.date
    }
    
    
    func setSelectedDate(selectedDate: String) {
        date = selectedDate
        symptomDate.setTitle(date, for: .normal)
    }
    
    // this is getting the date from the date modal and sending it to the symptom screen:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "datePickerSym" {
            let datePickerViewController: DatePickerViewController = segue.destination as! DatePickerViewController
            datePickerViewController.delegate = self
        }
    }

}
