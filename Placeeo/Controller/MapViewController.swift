//
//  MapViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
        
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager : CLLocationManager!
    
    
    
    let place = Place()
    var placeArray = [Place]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        
    }
    override func viewDidAppear(_ animated: Bool) {
        determineCurrentLocation()
    }
    
    
    
    
    
    func show(places: [Place]){
        
    }
    
    func clearPlaces() {
       
    }
    
}
    //MARK: - CLLocation Manager Delegate
    extension MapViewController : CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let mUserLocation:CLLocation = locations[0] as CLLocation
            
            let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
            let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(mRegion, animated: true)
            
        }
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error - locationManager: \(error.localizedDescription)")
        }
        //MARK: - Intance Methods
        
        func determineCurrentLocation(){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
            if CLLocationManager.locationServicesEnabled(){
                locationManager.startUpdatingLocation()
            }
            
        }
        
        
        
    }

