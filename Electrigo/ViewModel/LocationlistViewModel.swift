//
//  LocationlistViewModel.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import Foundation
import MapKit
import CoreLocation
class locationlistViewModel:ObservableObject {
    
    @Published var locations : [Location]
    @Published var CoordinateRegion = MKCoordinateRegion()
    @Published var MapLocation : Location{
        didSet{
            updateCoordinateRegion(location:MapLocation)
        }
    }
    var locationManager: LocationManager
    @Published var isListDisplayed = false
    
    
    init(){
        self.locationManager = LocationManager()
        let location =  LocationsDataService.locations
        locations=location
        MapLocation = LocationsDataService.locations.first!
        self.updateCoordinateRegion(location: locations.first!)
        
    }
    
    func updateCoordinateRegion(location: Location){
        CoordinateRegion = MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    func updateListState(){
        isListDisplayed.toggle()
    }
    
}
