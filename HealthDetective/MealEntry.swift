//
//  MealEntry.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/16/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.


import UIKit
import FirebaseDatabase

class Meal {
    
    //MARK: Properties
    
    var ref: FIRDatabaseReference?
    var mealName: String
//    var mealDateTime: Date
//    var mealPhoto: UIImage?
    
    //MARK: Initialization
    
    init(snapshot: FIRDataSnapshot) {
        ref = snapshot.ref
        
        
        
        let data = snapshot.value as! Dictionary<String, String>
        mealName = data["mealName"]! as String
//        mealDateTime = data["mealDateTime"]! as Date
//        mealPhoto = data["mealImage"] as photo
    }
    
}
