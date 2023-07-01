//
//  MapService.swift
//  CountryApp
//
//  Created by Felipe Augusto Correia on 30/06/23.
//

import Foundation
import MapKit

class MapService {
    
    var locationManager = CLLocationManager()
    
    func setLocation(viewController: UIViewController, map: MKMapView, latitude: Double, longitude: Double) {
        
        locationManager.delegate = viewController as? any CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let latitude: CLLocationDegrees = latitude
        let longitude: CLLocationDegrees = longitude
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let latitudeDelta: CLLocationDegrees = 2.5
        let longitudeDelta: CLLocationDegrees = 2.5
        
        let visualization: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: visualization)
        
        map.setRegion(region, animated: true)
    }
}

