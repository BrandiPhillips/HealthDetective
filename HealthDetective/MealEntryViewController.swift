//
//  MealEntryViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/14/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit
import Firebase

class MealEntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate, DatePicker, FoodPicker {
    
    // MARK: Properties:
    
    
    var date = ""
    var foods = [String]()
    // This should be in the model as well I think, then the model controller should send it here
    var user: FIRUser!
    
    
    //MARK: Outlets
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealNameField: UITextField!
    @IBOutlet weak var mealDetails: UITextView!
    @IBOutlet weak var mealDate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal Entry"
        mealDetails.layer.cornerRadius = 10
        mealImage.layer.cornerRadius = 10 
        mealNameField.delegate = self 
        user = FIRAuth.auth()?.currentUser
    
    }
    
    
    // MARK:  UITextViewDelegate methods:
    
    // hide keyboard when return key tapped in textView
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        self.mealDetails.resignFirstResponder()
        return true
    }
    
    // MARK: UITextFieldDelegate methods:
    
    // hide keyboard when return key tapped in textField:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mealNameField.resignFirstResponder()
        return true
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user cancels
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){
    
        // Use original image
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else{
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // set mealImage to display the selected image
        mealImage.image = selectedImage
        
        // dismiss the picker
        dismiss(animated: true, completion: nil) 
        
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        
        // allow photos to be picked from library
        imagePickerController.sourceType = .photoLibrary
        
        // notify viewcontroller when image is picked
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // TODO: make this package up the data and send it to the meal model controller:
    @IBAction func recordEntry(_ sender: Any) {
        let name = mealNameField.text!
        let details = mealDetails.text!
        let date = self.date
        let foods = self.foods
    
        let meal = ["mealName": name, "mealFoods": foods, "mealDetails": details, "mealDate": date] as [String : Any]
        
        newMealRef.setValue(meal)
    }
    
    // getting information from the modals and displaying them on the meal entry screen:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "datePicker" {
            let datePickerViewController: DatePickerViewController = segue.destination as! DatePickerViewController
            datePickerViewController.delegate = self
        } else if segue.identifier == "foodPicker" {
            let ingredientsViewController: IngredientsViewController = segue.destination as! IngredientsViewController
            ingredientsViewController.delegate = self
        }
    }
    
    func setSelectedDate(selectedDate: String) {
        date = selectedDate
        mealDate.setTitle(date, for: .normal)
    }
    
    func setSelectedFoods(selectedFoods: Array<String>) {
        foods = selectedFoods
        
    }
    

}


