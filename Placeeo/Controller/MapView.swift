//
//  MapViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIView {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    func show(places: [Place]){
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = place.coordinates
            mapView.addAnnotation(annotation)
        }
    }
    func centerViewOnUserLocation() {
        if let location = manager.location?.coordinate {
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 4500, longitudinalMeters: 4500)
            mapView.setRegion(region, animated: true)
    }
}
}
