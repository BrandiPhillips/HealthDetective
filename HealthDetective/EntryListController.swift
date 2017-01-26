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
    
    // how to I add the symptoms...
    //var symptoms = [Symptom]()
    //var meals = [Meal]()
    
    // array of dictionary's to populate the table with
    var entryData = [[String]]()
    
    var initialLoad = true

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
        return self.entryData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let entry = entryData[indexPath.row]
        cell.textLabel?.text = entry[0]
        cell.detailTextLabel?.text = entry[1]
        return cell
    }
    
    // override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       // if editingStyle == .delete {
         //   let meal = meals[indexPath.row]
           // meal.ref?.removeValue()
        //}
    //}
    
    // Listener Method:
    func startObservingDatabase () {
        databaseHandle = ref.child("users/\(self.user.uid)/meals").observe(.value, with: { (snapshot) in
            let mealDict = snapshot.value as! [String : AnyObject]
            print(mealDict)
            
            for mealDict in snapshot.children {
                var newMeal = [String]()
                let meal = Meal(snapshot: mealDict as! FIRDataSnapshot)
    
                newMeal.append(meal.mealName)
                newMeal.append(meal.mealDate)
                
                self.entryData.append(newMeal)
                print(self.entryData)
            //self.tableView.reloadData()
                
               
            }
            
        })
        
        databaseHandle = ref.child("users/\(self.user.uid)/symptoms").observe(.value, with: { (snapshot) in
            let symDict = snapshot.value as! [String : AnyObject]
            print(symDict)
            
            for symDict in snapshot.children {
                var newSym = [String]()
                let sym = Symptom(snapshot: symDict as! FIRDataSnapshot)
                // newMeals.append(meal)
                
                newSym.append(sym.symptomName)
                newSym.append(sym.symptomDate)
                
                self.entryData.append(newSym)
                self.tableView.reloadData()
            }
            
        })
        self.tableView.reloadData() 
    }
    
    deinit {
        ref.child("users/\(self.user.uid)/meals").removeObserver(withHandle: databaseHandle)
    }

}
