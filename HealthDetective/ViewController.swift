//
//  ViewController.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/7/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties:

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIImagePickerControllerDelegate:
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss the picker if user chooses to cancel
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // handle multiple image representations - original is desired - send msg if not chosen (this was done in a tutorial.  Not sure if it is neccessary, didn't explain why)
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // set photoImageView to display selected image:
        imageView.image = selectedImage
        
        // Dismiss the picker: 
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions:
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // imagePickerController:
        let imagePickerController = UIImagePickerController()
        
        // allow photos to be picked from photo library:
        imagePickerController.sourceType = .photoLibrary
        
        // notify viewController when user picks image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }

}

