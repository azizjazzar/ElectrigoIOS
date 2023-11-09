import SwiftUI
import MapKit


struct MapflotteViewRepresentable : UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    
    //lena bech tmake map view (screen lkol)
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
        
    }
     // lena bech n7athro les modification mtaa l map si l user ybader l place w ila yheb yarja3 l blasto
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        
        return MapCoordinator (parent: self)
    }
        
    
    
}

extension MapflotteViewRepresentable {
    // l partie hethi tkhalina net7akmo b user location naamlo ili n7ebo aalih b location mte3o/mapCoordinator hiya eli torbet 
    class MapCoordinator : NSObject , MKMapViewDelegate {
        let parent:MapflotteViewRepresentable
        init(parent: MapflotteViewRepresentable) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
