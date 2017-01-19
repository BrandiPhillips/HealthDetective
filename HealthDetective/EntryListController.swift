//
//  EntryListController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.


import UIKit
import Firebase

class EntryListController: UITableViewController {

    
    // MARK: Properties:
    
    var user: FIRUser!
   
    var ref: FIRDatabaseReference!
    private var databaseHandle: FIRDatabaseHandle!
    
    // array of meals used to populate the table
    var meals = [Meal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        user = FIRAuth.auth()?.currentUser
        ref = FIRDatabase.database().reference()
        // listen for any changes to the database:
        startObservingDatabase()
    }
    
    // MARK: Table view data source
    
    // going to start out with one section of all entries.  Want there to be separate sections by date:
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.mealName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let meal = meals[indexPath.row]
            meal.ref?.removeValue()
        }
    }
    
    // Listener Method:
    func startObservingDatabase () {
        databaseHandle = ref.child("users/\(self.user.uid)/meals").observe(.value, with: { (snapshot) in
            var newMeals = [Meal]()
            for mealSnapShot in snapshot.children {
                let meal = Meal(snapshot: mealSnapShot as! FIRDataSnapshot)
                newMeals.append(meal)
            }
            self.meals = newMeals
            self.tableView.reloadData()
        })
    }
    
    deinit {
        ref.child("users/\(self.user.uid)/meals").removeObserver(withHandle: databaseHandle)
    }

}
