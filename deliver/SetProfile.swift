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
        println("viewDidLoad")
       self.navigationItem.title="Create Profile"
        imagePicker.delegate = self
        var tap = UITapGestureRecognizer(target: self, action: Selector("onProfileClick"))
        profilePic.addGestureRecognizer(tap)
        profilePic.userInteractionEnabled = true
        
        var rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "onDoneClick:")
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
        
    }
    
    func onDoneClick (sender:UIButton) {
    switchToViewController("landingView")
    
    }
    
    func switchToViewController(identifier: String) {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! UIViewController
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }
    
    func onProfileClick()
    {
        println("onProfileClick")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePic.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}