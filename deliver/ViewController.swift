//
//  ViewController.swift
//  deliver
//
//  Created by JASPRET on 19/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var countryCode: UILabel!
    
    @IBOutlet weak var mobileNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Prefrences.getInstance.setCountrycode("1")
//        println(Prefrences.getInstance.getCountryCode())
        // Do any additional setup after loading the view, typically from a nib.
        
        doneButton.hidden=true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onDoneClick(sender: AnyObject) {
        
        
        Prefrences.getInstance.setCountrycode(countryCode.text!)
        Prefrences.getInstance.setMobileNumber(mobileNumber.text)
        
    }
    
    
    @IBAction func onTextChange(sender: UITextField) {
        
        if(count(sender.text)>=6){
            doneButton.hidden=false
        }else{
            doneButton.hidden=true
        }
        
        
        if(count(sender.text)>=1){
          var text=""
          text=countryCode.text!
          text+=mobileNumber.text
          self.title=text
        }else{
            self.title="Your Phone Number"
        }
    }
    
}

