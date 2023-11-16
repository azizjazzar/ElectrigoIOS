//
//  MapViewRepresentable.swift
//  Electrigo
//
//  Created by Aissa Dhia on 5/11/2023.
//

import SwiftUI
import MapKit


struct MapViewRepresentable : UIViewRepresentable {
    let mapView = MKMapView()
   
    
    
    //lena bch n7athro l map view
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
        
    }
     // lena bch n7athro les modification mtaa l map si l user ybader l place w ila yheb yarja3 l blasto
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        
        return MapCoordinator (parent: self)
    }
        
    
    
}

extension MapViewRepresentable {
    // l partie hethi tkhalina net7akmo b user location naamlo ili n7ebo aalih b location mte3o
    class MapCoordinator : NSObject , MKMapViewDelegate {
        let parent:MapViewRepresentable
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
