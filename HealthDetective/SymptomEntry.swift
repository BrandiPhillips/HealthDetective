//
//  SymptomEntry.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/21/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Symptom {
    
    //MARK: Properties
    
    var ref: FIRDatabaseReference?
    var symptomName: String
    var symptomDate: String
    var symptomDetails: String?
    
    init(snapshot: FIRDataSnapshot) {
        ref = snapshot.ref
        
        let data = snapshot.value as! Dictionary<String, String>
        symptomName = data["mealName"]! as String
        symptomDate = data["mealDate"]! as String
        symptomDetails = data["mealDetails"]! as String
    }
    
}
