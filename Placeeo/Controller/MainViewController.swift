//
//  ViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate, UISearchResultsUpdating{
    
    
    
    private let mapView: MapView = {
        MapView.loadFromNib() as! MapView
    }()
    
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    let places: [Place] = [
        Place(name: "Castle Uzhgorod", lat: 48.62216095313416, long: 22.308029690972464, identifier: "One"),
        Place(name: "Church", lat: 48.623380761219515, long: 22.302193204377218, identifier: "Two")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
        title = "Home"
        mapView.show(places: places)
        
        LocationManager.shared.getUserLocation{ [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.mapView.addPin(with: location)
                LocationManager.shared.resolveLocationName(with: location, completion: { [weak self] locationName in self?.title = locationName})
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
    func updateSearchResults(for searchController: UISearchController) {
    }
}

