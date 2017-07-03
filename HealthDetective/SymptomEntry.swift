//
//  SymptomEntry.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/21/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Symptom {
    
    //MARK: Properties
    
    let ref: FIRDatabaseReference?
    let symptomName: String
    let symptomDate: String
    let symptomDetails: String?
    
    init(snapshot: FIRDataSnapshot) {
        ref = snapshot.ref
        
        let data = snapshot.value as! Dictionary<String, String>
        symptomName = data["symptomName"]! as String
        symptomDate = data["symptomDate"]! as String
        symptomDetails = data["symptomDetails"]! as String
    }
    
}
