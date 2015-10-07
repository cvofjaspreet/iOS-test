//
//  SetProfile.swift
//  deliver
//
//  Created by JASPRET on 26/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit


class SetProfile: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    
     let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        print("viewDidLoad")
       self.navigationItem.title="Create Profile"
        imagePicker.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: Selector("onProfileClick"))
        profilePic.addGestureRecognizer(tap)
        profilePic.userInteractionEnabled = true
        profilePic.layer.borderWidth=1.0
        profilePic.layer.masksToBounds = true
        profilePic.layer.borderColor = UIColor.whiteColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.size.height/2
        profilePic.clipsToBounds = true
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "onDoneClick:")
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
    }
    
    func onDoneClick (sender:UIButton) {
    Prefrences.getInstance.setUserRegistered(true)
    switchToViewController("mainView")
    }
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popToRootViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! MainView
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }
    
    func onProfileClick()
    {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        optionMenu.addAction(cancelAction)
        //Create and add first option action
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            //Code for launching the camera goes here
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        optionMenu.addAction(takePictureAction)
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            //Code for picking from camera roll goes here
         
           self.imagePicker.allowsEditing = false
           self.imagePicker.sourceType = .PhotoLibrary
            
           self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        optionMenu.addAction(choosePictureAction)
        
      
        
        //Present the AlertController
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePic.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}