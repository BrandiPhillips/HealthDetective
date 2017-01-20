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
   

    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10
    }

    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil) 
    }
    

}


