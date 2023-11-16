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
                    MapMarker(coordinate: location.coordinates, tint: .red)
                }
                .onTapGesture {
                    let tappedCoordinate = vm.CoordinateRegion.center
                    if let tappedLocation = vm.locations.first(where: { tappedCoordinateIsInsideMapMarker($0.coordinates, tappedCoordinate) }) {
                        self.tappedLocation = tappedLocation
                        showLocationDetails.toggle()
                    }
                }
                .ignoresSafeArea(.all)

            VStack(spacing: 10) {
                VStack {
                    Text(vm.MapLocation.name + "," + vm.MapLocation.cityName)
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
                }
                .padding(.top, 20)

                if let tappedLocation = tappedLocation {
                    LocationDetailsView(location: tappedLocation, getDirectionsAction: {
                        // Implement your logic to show directions
                        print("Get Directions tapped for \(tappedLocation.name)")
                    })
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

    var body: some View {
        VStack(alignment: .leading) {
            Text("Location Details:")
                .font(.title)
                .padding(.bottom, 10)

            VStack(alignment: .leading, spacing: 8) {
                Text("Name: \(location.name)")
                Text("City: \(location.cityName)")
            }

            Button(action: {
                getDirectionsAction()
            }) {
                Text("Get Directions")
                    .font(.custom("Jost", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.05, green: 0.60, blue: 1))
                    .cornerRadius(12)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .foregroundColor(.black)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
