//
//  MapView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 5/11/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @EnvironmentObject var vm: locationlistViewModel
    @State private var CoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        private let locationManager = CLLocationManager()
    var body: some View {
        MapViewRepresentable().ignoresSafeArea()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
