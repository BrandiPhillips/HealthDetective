//
//  MealModelController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 7/3/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class MealModelController {
    
    var ref: FIRDatabaseReference!
    
    var user: FIRUser!
    
    let ref = FIRDatabase.database().reference()
    let newMealRef = ref.child("users/\(self.user.uid)/meals").childByAutoId()
    
    let meal = ["mealName": name, "mealFoods": foods, "mealDetails": details, "mealDate": date] as [String : Any]
    
    newMealRef.setValue(meal)
}
