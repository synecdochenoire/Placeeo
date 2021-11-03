//
//  GooglePlacesManager.swift
//  Placeeo
//
//  Created by Pasha Berger on 11.10.2021.
//

import Foundation
import GooglePlaces
import CoreLocation
final class GooglePlacesManager {
    
    let apiKey = "AIzaSyBLVcVo5N4mcs1PASpBMYzgpKuff_gkz8A"
    
    static let shared = GooglePlacesManager()
    
    private let client = GMSPlacesClient.shared()
    
    private init (){}
    
    enum PlacesError: Error{
        case failedToFind
        case failedToGetCoords
    }
    
    func getPlaces(around location: CLLocationCoordinate2D, completion: @escaping ([Place]) -> Void) {
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location.latitude),\(location.longitude)&radius=50000&type=restaurant&key=\(apiKey)") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let dictionary = json as? [String: Any],
                      let results = dictionary["results"] as? [Any]
                else { return }
                let places: [Place] = results.compactMap { result in
                    let place = result as? [String: Any]
                    
                    let geometry = place?["geometry"] as? [String: Any]
                    let coordinates = geometry?["location"] as? [String: Double]
                    guard let lat = coordinates?["lat"],
                          let name = place?["name"] as? String,
                          let lng = coordinates?["lng"]
                    else {return nil}
                    let placeCoordinates = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                    
                    return Place(name: name, coordinates: placeCoordinates)
                }
                completion(places)
            } catch {
                
            }
        }
        .resume()
        return
    }
}
