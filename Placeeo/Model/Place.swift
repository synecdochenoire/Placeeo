//
//  Place.swift
//  Placeeo
//
//  Created by Pasha Berger on 22.10.2021.
//

import Foundation
import struct CoreLocation.CLLocationCoordinate2D
struct Place {
    var name: String
    var coordinates: CLLocationCoordinate2D?
    var indentifier: String?

}
