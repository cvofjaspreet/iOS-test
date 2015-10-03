//
//  JXMPPConnection.swift
//  deliver
//
//  Created by JASPRET on 02/10/15.
//  Copyright © 2015 JASPRET. All rights reserved.
//

import Foundation

class JXMPPConnection : NSOperation{
    
    var jxmppConfig: JXMPPConfig?
    /**
    * The socket which is used for this connection.
    */
 
  
    /**
    * Creates a new XMPP connection in the same way {@link #XMPPConnection(String,CallbackHandler)} does, but
    * with no callback handler for password prompting of the keystore.  This will work
    * in most cases, provided the client is not required to provide a certificate to
    * the server.
    *
    * @param serviceName the name of the XMPP server to connect to; e.g. <tt>example.com</tt>.
    */
    func JXMPPConnection(serviceName: String) {
        // Create the configuration for this new connection
        jxmppConfig=JXMPPConfig.getInstance
        jxmppConfig!.setCompressionEnabled(false)
        jxmppConfig!.setSaslAuthEnabled(true)
        jxmppConfig!.setDebugEnabled(false)
        jxmppConfig!.setServiceName(serviceName)
    }
    
    
    func connectUsingConfiguration(){
    
    
    }
    
    
    
}