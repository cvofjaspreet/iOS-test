//
//  SelectCountryCode.swift
//  deliver
//
//  Created by JASPRET on 21/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit

class SelectCountryCode: UITableViewController{
    
    @IBOutlet weak var countryList: UITableView!
    
    var names: NSDictionary!
    
    var selectedCodeDictionary :  NSDictionary!
    
    var keys = [String]()
   
    
    override func viewDidLoad() {
      self.title="Select Your Country"
        
        loadCountries();
       
        var rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "onDoneClick:")
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
    }
    
    func onDoneClick (sender:UIButton) {
       
        if let indexPath = tableView.indexPathForSelectedRow(){
            var dictionary : NSDictionary!
            var dict=names[keys[indexPath.section]] as! [AnyObject]
            dictionary=dict[indexPath.row] as! NSDictionary
            
            Prefrences.getInstance.setCountryName((dictionary.valueForKey("name")  as? String)!)
            Prefrences.getInstance.setCountrycode((dictionary.valueForKey("country_code")  as? String)!)
        }
        
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }

    }
    func loadCountries(){
        
        if let path = NSBundle.mainBundle().pathForResource("CountryList", ofType: "plist") {
            names = NSDictionary(contentsOfFile: path)
        }
        if let dict = names {
            keys=(names.allKeys as! [String])
            keys.sort(){ $0 < $1 }
        }
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var dict=names[keys[section]] as! [AnyObject]
        return count(dict)
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "myCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: cellIdentifier)
        }
        var dictionary : NSDictionary!
        var dict=names[keys[indexPath.section]] as! [AnyObject]
        dictionary=dict[indexPath.row] as! NSDictionary
        cell!.textLabel!.text = dictionary.valueForKey("name") as? String
        cell!.detailTextLabel?.text = dictionary.valueForKey("country_code")  as? String
        return cell!
    }
    
   
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        if (!(parent?.isEqual(self.parentViewController) ?? false)) {
                   }
    }
 
}
