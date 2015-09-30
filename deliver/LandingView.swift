//
//  LandingView.swift
//  deliver
//
//  Created by JASPRET on 27/09/15.
//  Copyright (c) 2015 JASPRET. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import TwitterKit
//import DigitsKit

class LandingView: UIViewController , CLLocationManagerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(isUserRegistered()){
            self.title="Order at ?"
            let camera = GMSCameraPosition.cameraWithLatitude(30.7800,
                longitude: 76.6900, zoom: 6)
            let mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2), camera: camera)
            mapView.myLocationEnabled = true
            self.view.addSubview(mapView)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(30.7800,76.6900)
            marker.title = "Mohali"
            marker.snippet = "Punjab,India"
            marker.map = mapView
          

            let logInButton = TWTRLogInButton { (session, error) in
                // play with Twitter session
            }
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
//
//            let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
//                (session: DGTSession!, error: NSError!) in
//                // play with Digits session
//            })
//            authenticateButton.center = self.view.center
//            self.view.addSubview(authenticateButton)

        }else{
            switchToViewController("registerUser")
        }
    }
    
    func isUserRegistered() ->Bool{
    
    return Prefrences.getInstance.isUserRegistered()
    }
    
    func switchToViewController(identifier: String) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! RegisterView
        self.navigationController?.setViewControllers([viewController], animated: true)
        
    }

    
}