//
//  LocationlistView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import SwiftUI

struct LocationlistView: View {
    @EnvironmentObject var vm: locationlistViewModel
    @State private var selectedLocation: Location? 

    var body: some View {
        NavigationView {
            VStack {
                Text("Borne de recharge")
                    .font(.title)
                    .padding(.top, 10)

                List {
                    Section(header: Text("Locations")) {
                        ForEach(vm.locations) { location in
                            VStack(alignment: .leading, spacing: 8) {
                                Image(systemName: "location.circle")
                                    .foregroundColor(.blue)
                                Text(location.name)
                                    .font(.headline)
                                Text("City: \(location.cityName)")
                                    .font(.subheadline)
                                Text("Latitude: \(location.coordinates.latitude), Longitude: \(location.coordinates.longitude)")
                                    .font(.subheadline)
                                NavigationLink(destination: LocationDetailView(location: location)) {
                                    Text("325km")
                                        .foregroundColor(.green)
                                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.green, lineWidth: 1))
                                        .padding(.vertical, 3)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(26)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color.blue, lineWidth: 1))
                            .padding(.vertical, 5)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: MapView()) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                            Text("Retour").foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

struct LocationDetailView: View {
    var location: Location // Replace YourLocationType with your location type

    var body: some View {
        ScrollView {
                 VStack(alignment: .leading, spacing: 16) {
                     // Scrollable images
                     ScrollView(.horizontal, showsIndicators: true) {
                         HStack(spacing: 0) {
                             ForEach(location.imageNames, id: \.self) { imageName in
                                 Image(imageName)
                                     .resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .center)
                             }
                         }
                         .tabViewStyle(PageTabViewStyle())
                     }
                     .padding(.bottom, 10)
                
                Button(action: {
                    // Action for review button
                }) {
                    Text("Contribuer")
                              }
                              .padding(.vertical, 10)
                              .frame(width: 259, height: 50)
                              .background(Color.blue)
                              .cornerRadius(10)
                              .foregroundColor(.white)
                .padding(.horizontal, 60)

                // Title
                Text(location.name)
                    .font(.title)

                // Details
                Text("Details")
                    .font(.title2)
                    .padding(.top, 8)

                Text(location.description)
                    .font(.body)

                // Stars and buttons
                HStack {
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    
                    Spacer()

                    // Info button
                    Button(action: {
                        // Action for info button
                    }) {
                        Text("Info")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                            
                    }

                    // Review button
                    Button(action: {
                        // Action for review button
                    }) {
                        Text("Review")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 16)
            }
            .padding()
        }
        .navigationBarTitle(Text("Detail de Borne "), displayMode: .inline)
    }
}

struct LocationlistView_Previews: PreviewProvider {
    static var previews: some View {
        LocationlistView().environmentObject(locationlistViewModel())
    }
}
