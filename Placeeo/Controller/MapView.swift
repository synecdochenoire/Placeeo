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
    
    func show(places: [Place]){
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = CLLocationCoordinate2DMake(place.lat, place.long)
            mapView.addAnnotation(annotation)
        }
    }
}
