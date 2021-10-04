//
//  GooglePlacesManager.swift
//  Placeeo
//
//  Created by Pasha Berger on 03.10.2021.
//

import Foundation
import GooglePlaces
import GoogleMaps

struct PlacesForSearch{
    var name: String
    var identifier : String
 }

final class GooglePlacesManager {

    static let shared = GooglePlacesManager()
    
    private let client = GMSPlacesClient.shared()
   
   
    private init() {}
    
    

    enum PlacesError: Error {
        case failedToFind
    }
    public func setUp(){
        GMSPlacesClient.provideAPIKey("AIzaSyDCZGo_AIbCYHx_cLkQFdeTvP_ENIFKPuk")
        GMSServices.provideAPIKey("AIzaSyDCZGo_AIbCYHx_cLkQFdeTvP_ENIFKPuk")
    }
    public func findPlaces(query: String, completion: @escaping(Result<[PlacesForSearch], Error>)-> Void){
        let filter = GMSAutocompleteFilter()
        filter.type = .geocode
        client.findAutocompletePredictions(fromQuery: query, filter: filter, sessionToken: nil) { results, error in
            guard let results = results, error == nil else {
                completion(.failure(PlacesError.failedToFind))
                return
            }
            let places: [PlacesForSearch] = results.compactMap({PlacesForSearch(name: $0.attributedFullText.string, identifier: $0.placeID
            )
            })
            
            completion(.success(places))
        }
    }
}
