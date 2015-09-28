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

class LandingView: UIViewController , CLLocationManagerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(isUserRegistered()){
            self.title="Order at ?"
            let camera = GMSCameraPosition.cameraWithLatitude(30.7800,
                longitude: 76.6900, zoom: 6)
            let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
            mapView.myLocationEnabled = true
            self.view = mapView
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(30.7800,76.6900)
            marker.title = "Mohali"
            marker.snippet = "Punjab,India"
            marker.map = mapView
            
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