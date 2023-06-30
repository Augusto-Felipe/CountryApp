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
        
        let latitude: CLLocationDegrees = -23.586974
        let longitude: CLLocationDegrees = -46.657355
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let latitudeDelta: CLLocationDegrees = 0.02
        let longitudeDelta: CLLocationDegrees = 0.02
        
        let visualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: visualizacao)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Parque Ibirapuera"
        annotation.subtitle = "Maior parque da América Latina"
        
        map.addAnnotation(annotation)
    }
}

