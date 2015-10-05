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
import CoreLocation
class LandingView: UIViewController , CLLocationManagerDelegate, UISearchBarDelegate{
 
 
    var locationManager : CLLocationManager?
    var placesClient: GMSPlacesClient?
    var mapView : GMSMapView?
    var placePicker: GMSPlacePicker?
    var location: CLLocation?
    
    @IBOutlet weak var searchView: UISearchBar!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
          print("viewDidLoad")
      
            searchView.becomeFirstResponder()
            searchView.delegate = self
            self.title="Order at ?"
            let camera = GMSCameraPosition.cameraWithLatitude(0,
                longitude: 0, zoom: 16)
            mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), camera: camera)
            mapView!.myLocationEnabled = true
            self.view.addSubview(mapView!)
            placeApi()
            pickAPlace()
       
    }
   
    
  
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("viewDidDisappear")
    }
   
    func placeApi(){
     placesClient = GMSPlacesClient()
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
        placeAutocomplete(searchText)
        }
    }
    
    @IBAction func onEditLocationClick(sender: AnyObject) {
      self.view.endEditing(true)
        updateLocationOnUi()
    
    }
    
    
    func placeAutocomplete(searchText : String) {
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.Address
        placesClient?.autocompleteQuery(searchText, bounds: nil, filter: filter, callback: { (results, error: NSError?) -> Void in
            if let error = error {
                print("Autocomplete error \(error)")
            }
            
            for result in results! {
                if let result = result as? GMSAutocompletePrediction {
                    print(result)
                }
            }
        })
    }
    
    
    func pickAPlace(){
         locationManager=CLLocationManager()
         locationManager!.delegate=self
         locationManager!.desiredAccuracy=kCLLocationAccuracyBest
         locationManager!.requestWhenInUseAuthorization()
         locationManager!.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location=locations.last
        locationManager!.stopUpdatingLocation()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(self.location!.coordinate.latitude,self.location!.coordinate.longitude)
        marker.map = self.mapView
        let locationUpdate = GMSCameraPosition.cameraWithLatitude(self.location!.coordinate.latitude,longitude: self.location!.coordinate.longitude, zoom: 6)
        self.mapView!.camera = locationUpdate
    }
  
    
    func updateLocationOnUi(){
     self.view.endEditing(true)
    let center = CLLocationCoordinate2DMake(location!.coordinate.latitude,location!.coordinate.longitude)
    let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
    let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
    let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
    let config = GMSPlacePickerConfig(viewport: viewport)
    placePicker = GMSPlacePicker(config: config)
    self.mapView?.clear()
    placePicker?.pickPlaceWithCallback({(place: GMSPlace?, error: NSError?) -> Void in
    self.searchView.becomeFirstResponder()
    if error != nil {
    print("Pick Place error: \(error!.localizedDescription)")
    return
    }
    
     if place != nil {
    self.title = place!.name
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2DMake(self.location!.coordinate.latitude,self.location!.coordinate.longitude)
    marker.title=place!.formattedAddress
    //  marker.description=place.name
    marker.map = self.mapView
    let locationUpdate = GMSCameraPosition.cameraWithLatitude(self.location!.coordinate.latitude,longitude: self.location!.coordinate.longitude, zoom: 6)
    self.mapView!.camera = locationUpdate
    
    //self.addressLabel.text = "\n".join(place.formattedAddress.componentsSeparatedByString(", "))
    } else {
    self.title = "Order at ?"
    // self.addressLabel.text = ""
    }
    })
    }
    
    
    
    
  }
