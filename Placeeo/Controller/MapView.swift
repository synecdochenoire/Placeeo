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
    
    let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    let locationManager = CLLocationManager()
    
    let regionInMeters = 3500 
    
    func show(places: [Place]){
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = CLLocationCoordinate2DMake(place.lat, place.long)
            mapView.addAnnotation(annotation)
        }
    }
    func addPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        mapView.addAnnotation(pin)
    }
}



//    //MARK: - Zoom into current User location
//extension MapView: MKMapViewDelegate {
//
//    func centerViewOnUserLocation() {
//        if let location = locationManager.location?.coordinate{
//            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: CLLocationDistance(regionInMeters), longitudinalMeters: CLLocationDistance(regionInMeters))
//            mapView.setRegion(region, animated: true)
//        }
//    }
//
//    func checkLocationServices(){
//        if CLLocationManager.locationServicesEnabled(){
//            setupLocationManager()
//            checkLocationAuth()
//
//        }else{
//            //show alert
//        }
//    }
//}
//
////MARK: - CLLManager Delegate
//extension MapView: CLLocationManagerDelegate {
//
//    func setupLocationManager(){
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//
//    func checkLocationAuth() {
//        let manager = CLLocationManager()
//        switch manager.authorizationStatus {
//        case .authorizedAlways, .authorizedWhenInUse :
//            mapView.showsUserLocation = true
//            centerViewOnUserLocation()
//            manager.startUpdatingLocation()
//            break
//        case .restricted :
//            //show alert with info about
//            break
//        case .denied :
//            //show alert with instructions
//            break
//        case .notDetermined:
//            manager.requestWhenInUseAuthorization()
//        default:
//            break
//
//        }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        guard let location = locations.last else {return}
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//
//        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: CLLocationDistance(regionInMeters), longitudinalMeters: CLLocationDistance(regionInMeters))
//        mapView.setRegion(region, animated: true)
//    }
//
//
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuth()
//    }
//}
//}
//
