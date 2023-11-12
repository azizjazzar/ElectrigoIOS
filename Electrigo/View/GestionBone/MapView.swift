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
    @State private var showLocationList = false

    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $vm.CoordinateRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapMarker(coordinate: location.coordinates, tint: .red)
            })
            .ignoresSafeArea(.all)

            VStack(spacing: 10) {
                headerListItem

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
            .padding(.top, 20)
        }
        .fullScreenCover(isPresented: $showLocationList) {
            LocationlistView()
                .environmentObject(vm)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension MapView {
    var headerListItem: some View {
        VStack {
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
        }
    }
}






