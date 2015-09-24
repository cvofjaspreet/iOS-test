//
//  SelectCountryCode.swift
//  deliver
//
//  Created by JASPRET on 21/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit

class SelectCountryCode: UITableViewController,UITableViewDataSource{
    
    @IBOutlet weak var countryList: UITableView!
    
    var names: NSDictionary!
    
    
    override func viewDidLoad() {
      self.title="Select Your Country"
        
        loadCountries();
        
    }
    
    func loadCountries(){
        
        if let path = NSBundle.mainBundle().pathForResource("CountryList", ofType: "plist") {
            names = NSDictionary(contentsOfFile: path)
        }
        if let dict = names {
            var keys=names.allKeys
            
            println(keys)
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
   override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! UITableViewCell
       
        return cell
    }
 
}
