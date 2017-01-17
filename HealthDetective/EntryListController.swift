//
//  EntryListController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/13/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

//import UIKit
//import Firebase
//
//class EntryListController: UITableViewController {
//    
//    // MARK: Properties:
//    
//    var user: FIRUser!
//    var mealEntries = [mealEntry]()
//    var ref: FIRDatabaseReference!
//    private var databaseHandle: FIRDatabaseHandle!
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        user = FIRAuth.auth()?.currentUser
//        ref = FIRDatabase.database().reference()
//        // listen for any changes to the database:
//        startObservingDatabase()
//    }
//    
//    // MARK: Table view data source
//    
//    // going to start out with one section of all entries.  Want there to be separate sections by date:
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return mealEntries.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(performSegue(withIdentifier: "cell", for: indexPath)
//        let mealEntry = mealEntries[indexPath.row]
//        cell.textLabel?.text = mealEntry.mealName
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let mealEntry = mealEntries[indexPath.row]
//            mealEntry.ref?.removeValue()
//        }
//    }
//    
//    // Listener Method:
//    func startObservingDatabase () {
//        databaseHandle = ref.child("users/\(self.user.uid)/items").observe(.value, with: { (snapshot) in
//            var newEntries = [mealEntry]()
//            for mealEntrySnapShot in snapshot.children {
//                let mealEntry = MealEntry(snapshot: mealEntrySnapShot as! FIRDataSnapshot)
//                newEntries.append(mealEntry)
//            }
//            self.mealEntries = newEntries
//            self.tableView.reloadData()
//        })
//    }
//    
//    deinit {
//        ref.child("users/\(self.user.uid)/items").removeObserver(withHandle: databaseHandle)
//    }

//}
