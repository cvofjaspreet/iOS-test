//
//  MainView.swift
//  deliver
//
//  Created by JASPRET on 06/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation

import UIKit

class MainView: UIViewController
{


    
    override func viewDidLoad() {
        if(isUserRegistered()){
        
            pushToViewController("baseView1")
           
           
        }else{
            switchToViewController("registerUser")
        }
    }
    func pushToViewController(identifier: String) {
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! BaseView1
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! RegisterView
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }
    
    
    func isUserRegistered() ->Bool{
        
        return Prefrences.getInstance.isUserRegistered()
        
    }
    
    
    
   }