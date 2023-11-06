//
//  LocationlistViewModel.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import Foundation
import MapKit
class locationlistViewModel:ObservableObject {
    
    @Published var locations : [Location]
    init(){
        let location =  LocationsDataService.locations
        locations=location
        
    }
    
}
