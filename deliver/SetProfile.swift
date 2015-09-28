//
//  SetProfile.swift
//  deliver
//
//  Created by JASPRET on 26/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit

class SetProfile: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var profilePic: UIImageView!
    
       let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        print("viewDidLoad")
       self.navigationItem.title="Create Profile"
        imagePicker.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: Selector("onProfileClick"))
        profilePic.addGestureRecognizer(tap)
        profilePic.userInteractionEnabled = true
        
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "onDoneClick:")
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
        
    }
    
    func onDoneClick (sender:UIButton) {
    Prefrences.getInstance.setUserRegistered(true)
    switchToViewController("landingView")
    }
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! LandingView
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }
    
    func onProfileClick()
    {
        print("onProfileClick")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePic.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}