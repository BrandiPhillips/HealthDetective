//
//  IngredientsViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/19/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

protocol FoodPicker {
    func setSelectedFoods(selectedFoods: Array<String>)
}


class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties:
    
    var delegate: FoodPicker?
    
    // an array of foods selected from table
    var selectedFoods = [String]()
    
    // Arrays of food types
    var protein: [String] = []
    var grains: [String] = []
    var dairy: [String] = []
    var veggies: [String] = []
    var fruit: [String] = []
    var beans: [String] = []
    var nutsAndSeeds: [String] = []
    var fats: [String] = []
    
    let cellIdentifier = "FoodItem" 
    
    
    // Outlets:
    @IBOutlet weak var foodList: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodList.dataSource = self
        foodList.delegate = self
        foodList.layer.cornerRadius = 10
        foodList.allowsMultipleSelection = true
        
        protein = ["Beef", "Pork", "Chicken", "Turkey", "Lamb", "fish", "Shellfish"]
        grains = ["Wheat", "Brown Rice", "White Rice", "Oats", "Quinoa"]
        dairy = ["Milk", "Yogurt", "Butter", "Soft Cheese", "Hard Cheese"]
        veggies = ["Broccoli", "Green Beans", "Carrots", "Onion", "Garlic", "Aspargus", "Cabbage", "Spinach", "Kale", "Bell Peppers"]
        fruit = ["Strawberries", "Apples", "Oranges", "Bananas", "Pineapple", "Blueberries", "Melon", "Pears"]
        beans = ["Black Beans", "Blackeyed Peas", "Kidney Beans", "Garbanzo Beans", "Lentils"]
        nutsAndSeeds = ["Almonds", "Cashews", "Pecans", "Walnuts", "Pinenuts", "Sessame Seeds", "Sunflower Seeds", "Hemp Seeds", "Chia Seeds"]
        fats = ["Olive Oil", "Coconut Oil", "Veggetable Oil", "Avocado Oil"]
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return protein.count
        case 1:
            return grains.count
        case 2:
            return dairy.count
        case 3:
            return veggies.count
        case 4:
            return fruit.count
        case 5:
            return beans.count
        case 6:
            return nutsAndSeeds.count
        case 7:
            return fats.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Protein"
        case 1:
            return "Grains"
        case 2:
            return "Dairy"
        case 3:
            return "Veggies"
        case 4:
            return "Fruit"
        case 5:
            return "Beans"
        case 6:
            return "Nuts & Seeds"
        case 7:
            return "Fats"
        default:
            return ""
        }
        
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodList.dequeueReusableCell(withIdentifier: "foodItem")
        let section = indexPath.section
        switch section {
        case 0:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = protein[indexPath.row]
            return cell!
        case 1:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = grains[indexPath.row]
            return cell!
        case 2:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = dairy[indexPath.row]
            return cell!
        case 3:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = veggies[indexPath.row]
            return cell!
        case 4:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = fruit[indexPath.row]
            return cell!
        case 5:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = beans[indexPath.row]
            return cell!
        case 6:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = nutsAndSeeds[indexPath.row]
            return cell!
        case 7:
            cell?.accessoryType = (cell?.isSelected)! ? .checkmark : .none
            cell?.selectionStyle = .none
            cell?.textLabel?.text = fats[indexPath.row]
            return cell!
        default:
            return cell! 
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        foodList.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        let section = indexPath.section
        switch section {
        case 0:
           selectedFoods.append(protein[indexPath.row])
        case 1:
            selectedFoods.append(grains[indexPath.row])
        case 2:
            selectedFoods.append(dairy[indexPath.row])
        case 3:
           selectedFoods.append(veggies[indexPath.row])
        case 4:
            selectedFoods.append(fruit[indexPath.row])
        case 5:
            selectedFoods.append(beans[indexPath.row])
        case 6:
            selectedFoods.append(nutsAndSeeds[indexPath.row])
        case 7:
           selectedFoods.append(fats[indexPath.row])
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        foodList.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
 
    
    //MARK: Format Date and time and set selectedFoods for MealEntryViewController
    func passDataBackwards() -> Array<String>? {
        
        return selectedFoods
        
    }

 
    @IBAction func dismissPopover(_ sender: Any) {
        if delegate != nil {
            delegate?.setSelectedFoods(selectedFoods: passDataBackwards()!)
        }
         dismiss(animated: true, completion: nil)
    }

}
