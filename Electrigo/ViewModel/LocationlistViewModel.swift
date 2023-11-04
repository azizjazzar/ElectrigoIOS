//
//  LocationlistViewModel.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
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
