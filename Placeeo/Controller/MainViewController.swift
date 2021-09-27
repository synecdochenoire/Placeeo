//
//  ViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate{
    
    private let mapView: MapView = {
        MapView.loadFromNib() as! MapView
    }()
    
    let places: [Place] = [
        Place(name: "Castle Uzhgorod", lat: 48.62216095313416, long: 22.308029690972464),
        Place(name: "Church", lat: 48.623380761219515, long: 22.302193204377218)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mapView.show(places: places)
        //mapView.clearPlaces()
    }
}

