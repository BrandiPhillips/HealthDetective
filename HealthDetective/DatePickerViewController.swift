//
//  DatePickerViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/19/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

protocol DatePicker {
    func setSelectedDate(selectedDate: String)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePicker?
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
   

    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10
    }
    
     //MARK: Format Date and time and set selectedDate for MealEntryViewController
    func passDateBackwards() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let selectedDate = dateFormatter.string(from: datePicker.date)
        return selectedDate
        
    }


    @IBAction func selectDateTapped(_ sender: Any) {
        if delegate != nil {
            delegate?.setSelectedDate(selectedDate: passDateBackwards()!)
        }
        dismiss(animated: true, completion: nil)
        
    } 
    

//    override func prepare(for Segue: UIStoryboardSegue, sender: Any?) {
//        if Segue.identifier == "dateSelect" {
//            let destination = Segue.destination as! MealEntryViewController
//                destination.stringPassed = (sender as? String)!
//        }
//    }
    

}


