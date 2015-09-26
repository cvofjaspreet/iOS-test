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

class LandingView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}