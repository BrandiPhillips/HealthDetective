//
//  MealEntryViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/14/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class MealEntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    // MARK: Properties:
    
    var datePicker : UIDatePicker!
    
    //MARK: Outlets
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealNameField: UITextField!
    @IBOutlet weak var mealDateTimeField: UITextField!
    @IBOutlet weak var mealDetails: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meal Entry"
        mealDetails.layer.cornerRadius = 5

        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(MealEntryViewController.dismissPicker))
        
        mealDateTimeField.inputAccessoryView = toolBar
    }
    
    // MARK:  UITextViewDelegate methods:
    
    // hide keyboard when return key tapped in textView
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        self.mealDetails.resignFirstResponder()
        return true
    }
    
    // MARK: UITextFieldDelegate methods:
    
    // hide keyboard when return key tapped:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mealNameField.resignFirstResponder()
        return true
    }
    
    // update date time field using date picker:
    func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        mealDateTimeField.text = dateFormatter.string(from: sender.date)
        
        print("new date?") // this isn't working... 
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: (Selector(("datePickerChanged:"))), for: .valueChanged)
        
//        print("did it work")
    }
    
    func dismissPicker() {
        
        view.endEditing(true)
        
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
    
 

    @IBAction func mealDateTimeEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    }

    @IBAction func recordEntry(_ sender: UIButton) {
    }

}

// Make a done button for date picker
extension UIToolbar {
    
    func ToolbarPicker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
