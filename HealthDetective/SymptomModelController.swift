//
//  SymptomModelController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 7/3/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SymptomModelController {
    
    //MARK: Properties:
    var ref: FIRDatabaseReference!
    var user: FIRUser!
    
    // TODO: need to get the data from the view controller then send it to firebase:
    let ref = FIRDatabase.database().reference()
    let newSymRef = ref.child("users/\(self.user.uid)/symptoms").childByAutoId()
    let symptom = ["symptomName": name, "symptomDetails": details, "symptomDate": date]
    
    newSymRef.setValue(symptom)
}
