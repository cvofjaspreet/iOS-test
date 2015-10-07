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

    var base1 : BaseView1?
    var base2 : BaseView2?

    
    override func viewDidLoad() {
        if(isUserRegistered()){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            base1 = storyboard.instantiateViewControllerWithIdentifier("baseView1") as! BaseView1;
            base2 = storyboard.instantiateViewControllerWithIdentifier("baseView2") as! BaseView2;
            
           
           
        }else{
            switchToViewController("registerUser")
        }
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