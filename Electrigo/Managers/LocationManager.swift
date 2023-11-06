//
//  LocationManager.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import Foundation
import CoreLocation
class LocationManager:NSObject,ObservableObject{
    private let locationManager = CLLocationManager()
    override init() {
        super .init()
        locationManager.delegate = self
        //accurcy of location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // request authoraziration men aand l user :always/while using phone / never
        locationManager.requestWhenInUseAuthorization()
        // to93ed tabab3 f coordinates mtaa l user
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else {return}
        print(locations.first)
        //locationManager.stopUpdatingLocation()
    }
}
