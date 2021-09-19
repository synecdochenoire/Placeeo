//
//  ViewController.swift
//  Placeeo
//
//  Created by Pasha Berger on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {

    var placesArray: [Place] = []
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let mapViewController = MapViewController()
        
        mapViewController.show(places: placesArray)
       
        present(mapViewController, animated: true, completion: nil)
    }
    

    
    
}
