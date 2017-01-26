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
    var mealDate: String
    var mealFoods: Array<String>
    var mealDetails: String?
    //var mealImage: String?
    
    //MARK: Initialization
    
//    init?(name: String, photo: UIImage?, rating: Int) {
//        self.mealName = name
//        self.mealImage = photo?
//        self.mealDetails = details?
//        self.mealDate = date
//    }
    
    init(snapshot: FIRDataSnapshot) {
        ref = snapshot.ref
        
        
        
        let data = snapshot.value as! Dictionary<String, Any>
        mealName = data["mealName"]! as! String
        mealDate = data["mealDate"]! as! String
        mealFoods = data["mealFoods"]! as! Array<String>
        mealDetails = data["mealDetails"]! as? String
    }
    
}
