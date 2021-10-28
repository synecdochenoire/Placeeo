//
//  ViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    private let mapView: MapView = {
        MapView.loadFromNib() as! MapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        title = "Home"
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                GooglePlacesManager.shared.getPlaces(around: location.coordinate) { places in
                    strongSelf.mapView.show(places: places)
                }
            }
        }
        mapView.centerViewOnUserLocation()
        mapView.mapView.showsUserLocation = true
        
    }
    
}


