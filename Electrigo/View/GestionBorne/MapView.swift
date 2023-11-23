import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @EnvironmentObject var vm: locationlistViewModel
    @State private var showLocationList = false
    @State private var tappedLocation: Location? = nil
    @State private var showLocationDetails = false

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $vm.CoordinateRegion,
                showsUserLocation: true,
                annotationItems: vm.locations) { location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.coordinate.coordinates[1], longitude: location.coordinate.coordinates[0]), tint: .red
                
                )
                
                
            }
            .onTapGesture {
                let tappedCoordinate = vm.CoordinateRegion.center
                if let tappedLocation = vm.locations.first(where: { location in
                    let locationCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.coordinates[1], longitude: location.coordinate.coordinates[0])
                    return tappedCoordinateIsInsideMapMarker(locationCoordinate, tappedCoordinate)
                }) {
                    showLocationDetailsView(location: tappedLocation)
                }
            }
            .ignoresSafeArea(.all)

            VStack(spacing: 10) {
                VStack {
                    if let mapLocation = vm.MapLocation {
                        Text(mapLocation.name + "," + mapLocation.cityname)
                            .font(.system(size: 25, weight: .semibold, design: .serif))
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 50, alignment: .center)
                            .background(.ultraThickMaterial)
                            .cornerRadius(20)
                            .overlay(Button(action: {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    vm.updateListState()
                                }
                            }, label: {
                                Image(systemName: "arrow.down")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                    .rotationEffect(Angle(degrees: vm.isListDisplayed ? 180 : 0))
                            }), alignment: .leading)

                        if vm.isListDisplayed {
                            List {
                                ForEach(vm.locations) { location in
                                    ListLocationMapView(location: location)
                                        .padding(4)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .padding(.horizontal, 30)
                        }
                    } else {
                        // Handle the case when MapLocation is nil
                        Text("Default Text or Placeholder")
                    }
                }
                .padding(.top, 20)
                .animation(.easeInOut)

                if let tappedLocation = tappedLocation {
                            LocationDetailsView(
                                location: tappedLocation,
                                getDirectionsAction: {
                                    // Implement your logic to show directions
                                    print("Get Directions tapped for \(tappedLocation.name)")
                                },
                                openMapsAppForDirections: {
                                    openMapsAppForDirections(location: tappedLocation)
                                },
                                showLocationDetails: $showLocationDetails
                            )
                            .offset(y: showLocationDetails ? 0 : UIScreen.main.bounds.height)
                            .animation(.spring())
                            .onTapGesture {
                                showLocationDetails.toggle()
                            }
                        }


                Spacer()

                HStack(alignment: .bottom) {
                    Button(action: {
                        showLocationList = true
                    }) {
                        Image(systemName: "list.bullet")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 10)
            }
        }
        .fullScreenCover(isPresented: $showLocationList) {
            LocationlistView()
                .environmentObject(vm)
                .onDisappear {
                    tappedLocation = nil
                }
        }
        .navigationBarBackButtonHidden(true)
    }

    func showLocationDetailsView(location: Location) {
        self.tappedLocation = location
        showLocationDetails.toggle()
    }

    func tappedCoordinateIsInsideMapMarker(_ markerCoordinate: CLLocationCoordinate2D, _ tappedCoordinate: CLLocationCoordinate2D) -> Bool {
        let markerRadius: CLLocationDistance = 5000 // Adjust as needed
        let markerLocation = CLLocation(latitude: markerCoordinate.latitude, longitude: markerCoordinate.longitude)
        let tappedLocation = CLLocation(latitude: tappedCoordinate.latitude, longitude: tappedCoordinate.longitude)

        return markerLocation.distance(from: tappedLocation) <= markerRadius
    }
}

struct LocationDetailsView: View {
    var location: Location
    var getDirectionsAction: () -> Void
    var openMapsAppForDirections: () -> Void
    @Binding var showLocationDetails: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text("Détails de l'emplacement :")
                .font(.title2)
                .padding(.bottom, 10)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "mappin")
                    Text("Nom: \(location.name)")
                        .font(.custom("Jost", size: 16))
                        .fontWeight(.medium)
                }
                HStack {
                    Image(systemName: "building")
                    Text("Ville: \(location.cityname)")
                        .font(.custom("Jost", size: 16))
                        .fontWeight(.medium)
                }
                
                HStack {
                    Image(systemName: "tag.fill")
                    Text("Type: \(location.typelocation)")
                        .font(.custom("Jost", size: 16))
                        .fontWeight(.medium)
                }
            }

            Button(action: {
                openMapsAppForDirections()
            }) {
                Text("Obtenir des directions")
                    .font(.custom("Jost", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color(red: 0.05, green: 0.60, blue: 1))
                    .cornerRadius(12)
            }
            .padding(.top, 20)

   
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(10)
        .foregroundColor(.black)
    }
}



private func openMapsAppForDirections(location: Location) {
    // Ensure there is a valid coordinate
    guard location.coordinate.coordinates.count == 2 else {
        return
    }

    // Access the coordinates directly, since they are not optional
    let destinationCoordinate = location.coordinate

    let destinationPlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(
        latitude: destinationCoordinate.coordinates[1],
        longitude: destinationCoordinate.coordinates[0]
    ))
    let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

    destinationMapItem.name = location.name

    let sourceMapItem = MKMapItem.forCurrentLocation()

    MKMapItem.openMaps(
        with: [sourceMapItem, destinationMapItem],
        launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
    )
}


struct CustomAnnotationView: View {
    var body: some View {
        Image(systemName: "mappin.circle.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.red)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
