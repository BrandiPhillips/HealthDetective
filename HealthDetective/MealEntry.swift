//
//  MealEntry.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/16/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.


import UIKit
import FirebaseDatabase

struct Meal {
    
    //MARK: Properties
    
    let ref: FIRDatabaseReference?
    let mealName: String
    let mealDate: String
    let mealFoods: Array<String>
    let mealDetails: String?
    //let mealImage: String?
    
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
