//
//  ViewController.swift
//  deliver
//
//  Created by JASPRET on 19/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var countryCode: UILabel!
    
    @IBOutlet weak var mobileNumber: UITextField!
    
    @IBOutlet weak var countryName: UIButton!
    
    override func viewDidLoad() {
        
        doneButton.hidden=true
        
        print("viewDidLoad")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onDoneClick(sender: AnyObject) {
        
        
        Prefrences.getInstance.setCountrycode(countryCode.text!)
        Prefrences.getInstance.setMobileNumber(mobileNumber.text!)
        Prefrences.getInstance.setCountryName((countryName.titleLabel?.text!)!)
        switchToViewController("verifyUser")
    }
    
    func switchToViewController(identifier: String) {
       
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! VerifyUserView
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func onTextChange(sender: UITextField) {
        
        if(sender.text!.characters.count>=6){
            doneButton.hidden=false
        }else{
            doneButton.hidden=true
        }
        
        
        if(sender.text!.characters.count>=1){
          var text="+"
          text+=countryCode.text!
          text+=mobileNumber.text!
          self.title=text
        }else{
            self.title="Your Phone Number"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let country=Prefrences.getInstance.getCountryName()
        print(country)
        countryCode.text=Prefrences.getInstance.getCountryCode()
        countryName.setTitle(country, forState: .Normal)
        if(mobileNumber.text!.characters.count>=1){
        var text="+"
        text+=countryCode.text!
        text+=mobileNumber.text!
        self.title=text
        }
    }
}

