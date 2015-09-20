//
//  Prefrences.swift
//  deliver
//
//  Created by JASPRET on 19/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation

class Prefrences {
    
    let countryCodeKeyConstant = "countryCode"
    
    
    static let getInstance = Prefrences()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setCountrycode(countyCode : String){
    defaults.setObject(countyCode, forKey: countryCodeKeyConstant)
    }
    
    func getCountryCode() -> String {
     return defaults.stringForKey(countryCodeKeyConstant)!
    }
    
    
    
}
