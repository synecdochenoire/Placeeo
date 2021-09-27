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
    
    //    let locationManager = CLLocationManager()
    //    let regionInMeters : Double = 3000
    
    @IBOutlet weak var mapView: MKMapView!
    
    func show(places: [Place]){
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = CLLocationCoordinate2DMake(place.lat, place.long)
            mapView.addAnnotation(annotation)
        }
    }
    
    func clearPlaces(){
        let annotations = self.mapView.annotations
        if !annotations.isEmpty{
            mapView.removeAnnotations(annotations)
        }else{
            print("There is no annotations to Delete")
        }
    }
}




