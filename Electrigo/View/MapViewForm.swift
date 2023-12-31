import SwiftUI
import MapKit

struct MapViewForm: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var annotations: [MKPointAnnotation]
    let onSelect: (CLLocationCoordinate2D) -> Void

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        updateAnnotations(for: mapView)

        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.mapTapped(_:)))
        mapView.addGestureRecognizer(tapGesture)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setCenter(centerCoordinate, animated: true)
        updateAnnotations(for: uiView)
    }

    func updateAnnotations(for mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewForm

        init(_ parent: MapViewForm) {
            self.parent = parent
        }

        @objc func mapTapped(_ gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: gesture.view)
            let coordinate = (gesture.view as? MKMapView)?.convert(location, toCoordinateFrom: gesture.view)
            if let coordinate = coordinate {
                let roundedCoordinate = CLLocationCoordinate2D(
                    latitude: round(coordinate.latitude * 10000) / 10000,
                    longitude: round(coordinate.longitude * 10000) / 10000
                )
                parent.onSelect(roundedCoordinate)

                // Update annotations
                let annotation = MKPointAnnotation()
                annotation.coordinate = roundedCoordinate
                parent.annotations = [annotation] // Replace with new annotation
            }
        }
    }
}
