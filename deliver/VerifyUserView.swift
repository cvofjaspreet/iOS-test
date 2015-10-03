//
//  VerifyUserView.swift
//  deliver
//
//  Created by JASPRET on 03/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit
class VerifyUserView: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var verificationCode: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func onTextChange(sender: UITextField) {
        if (sender.text?.characters.count > 6) {
            sender.deleteBackward()
            
        }
        if (sender.text?.characters.count == 6) {
            switchToViewController("setProfile")
        }
    }
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popToRootViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! SetProfile
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}