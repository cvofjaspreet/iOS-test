//
//  JXMPPConfig.swift
//  deliver
//
//  Created by JASPRET on 02/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation

class JXMPPConfig{

    var connectionPort: Int = 5222
    var compressionEnabled: Bool=false
    var saslAuthEnabled: Bool=false
    var debugEnabled: Bool=false
    var serviceName: String?
    
    static let getInstance = JXMPPConfig()
    
    func getConnectionPort() -> Int{
    return connectionPort
    }
    
    func setCompressionEnabled(enabled: Bool){
        compressionEnabled=enabled
    }
    
    func getCompressionEnabled() -> Bool{
        return compressionEnabled
    }
    
    
    func setSaslAuthEnabled(enabled: Bool){
        saslAuthEnabled=enabled
    }
    
    func getSaslAuthEnabled() -> Bool{
        return saslAuthEnabled
    }
    
    
    func setDebugEnabled(enabled: Bool){
        debugEnabled=enabled
    }
    
    func getDebugEnabled() -> Bool{
        return debugEnabled
    }
    
    func setServiceName(name: String){
        serviceName=name
    }
    
    func getServiceName() -> String{
        return serviceName!
    }
    
}