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
    let mobileNumberKeyConstant = "mobileNumber"
    let countryNameKeyConstant = "countryName"
    let isRegisteredKeyConstant = "isRegistered"
    
    static let getInstance = Prefrences()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func setCountrycode(countyCode : String){
    defaults.setObject(countyCode, forKey: countryCodeKeyConstant)
    }
    
    func getCountryCode() -> String {
     return defaults.stringForKey(countryCodeKeyConstant) ?? "1"
    }
    
    func setMobileNumber(mobileNumber : String){
        defaults.setObject(mobileNumber, forKey: mobileNumberKeyConstant)
    }
    
    func getMobileNumber() -> String {
        return defaults.stringForKey(mobileNumberKeyConstant) ?? ""
    }
   
    func setCountryName(mobileNumber : String){
        defaults.setObject(mobileNumber, forKey: countryNameKeyConstant)
    }
    
    func getCountryName() -> String {
        return defaults.stringForKey(countryNameKeyConstant) ?? "United States"
    }
    
    func setUserRegistered(isRegistered : Bool){
        defaults.setObject(isRegistered, forKey: isRegisteredKeyConstant)
    }
    
    func isUserRegistered() -> Bool {
        return defaults.boolForKey(isRegisteredKeyConstant) ?? false
    }

}
