//
//  ViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: MapViewController{

  let mapVC = MapViewController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
          let placeOne = Place(name: "Castle Uzhgorod", lat: 48.62216095313416, long: 22.308029690972464)
          let placeTwo = Place(name: "Church", lat: 48.623380761219515, long: 22.302193204377218)
          
          
          let places = [placeOne, placeTwo]
          
   
        
        
      let mapViewController = MapViewController()
   
    }
    
  

    
    
}
