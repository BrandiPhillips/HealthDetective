//
//  DatePickerViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/19/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10
    }


    @IBAction func selectDateTapped(_ sender: Any) {
      
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let userInput = dateFormatter.string(from: datePicker.date)
        performSegue(withIdentifier: "dateSelect", sender: userInput)
            
//        dismiss(animated: true, completion: nil)
        
    }
    
//    //MARK: Format Date and time
    override func prepare(for Segue: UIStoryboardSegue, sender: Any?) {
        if Segue.identifier == "dateSelect" {
            let destination = Segue.destination as! MealEntryViewController
                destination.stringPassed = (sender as? String)!
        }
    }
    

}


