//
//  Location.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import Foundation
import MapKit


struct Location:Identifiable
{
    var name : String
    var cityName : String
    var coordinates: Coordinates
    var description : String
    var imageNames : [String]
    var id :String{
        return name+cityName
        
    }
    
    struct Coordinates {
        var latitude: Double
        var longitude: Double
    }

}
