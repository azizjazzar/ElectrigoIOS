//
//  AddBorneView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 6/11/2023.
//

import SwiftUI

struct AddBorneView: View {
    @StateObject var vm = locationlistViewModel()
    @State private var name: String = ""
    @State private var cityname: String = ""
    @State private var latitude: String = "40.7128"
    @State private var longitude: String = "-74.0060"
    @State private var address: String = ""
    @State private var typelocation: String = ""
    @State private var typecharge: String = ""
    @State private var picture: String = ""
    @State private var selectedTypelocation: Int = 0
    @State private var selectedTypeParking: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nom:")) {
                    TextField("Example:", text: $name)
                        .font(.body)
                        .padding(0)
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.black)
                            }
                        )
                        .padding(.vertical, 8)
                        .background(Color.clear)
                        .foregroundColor(.black)
                }
                Section(header: Text("City Name:")) {
                    TextField("Example:", text: $cityname)
                        .font(.body)
                        .padding(0)
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.black)
                            }
                        )
                        .padding(.vertical, 8)
                        .background(Color.clear)
                        .foregroundColor(.black)
                }
                Section(header: Text("Adresse")) {
                    TextField("Example:", text: $address)
                        .font(.body)
                        .padding(0)
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.black)
                            }
                        )
                        .padding(.vertical, 8)
                        .background(Color.clear)
                        .foregroundColor(.black)
                }

                Section(header: Text("Type:")) {
                    Picker("Type", selection: $selectedTypelocation) {
                        Text("Restaurant").tag(0)
                        Text("Station").tag(1)
                        Text("Hotel").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

              

                Section(header: Text("Type:")) {
                    Picker("Parking is:", selection: $selectedTypeParking) {
                        Text("Gratuit").tag(0)
                        Text("Payé").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                VStack {
                    Text("Location Coordinates :")
                        .font(.body)
                        .padding(.bottom, 8)

                    HStack {
                        Section() {
                            TextField("Latitude", text: $latitude)
                                .font(.body)
                                .padding(0)
                                .background(
                                    VStack {
                                        Spacer()
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(.black)
                                    }
                                )
                                .padding(.vertical, 8)
                                .background(Color.clear)
                                .foregroundColor(.black)
                        }

                        Section() {
                            TextField("Longitude", text: $longitude)
                                .font(.body)
                                .padding(0)
                                .background(
                                    VStack {
                                        Spacer()
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(.black)
                                    }
                                )
                                .padding(.vertical, 8)
                                .background(Color.clear)
                                .foregroundColor(.black)

                        }

                    }
                    
                    
                    
                }
                Section(header: Text("Picture")) {
                    TextField("Example:", text: $picture)
                        .font(.body)
                        .padding(0)
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.black)
                            }
                        )
                        .padding(.vertical, 8)
                        .background(Color.clear)
                        .foregroundColor(.black)
                }

                Section {
                    HStack(spacing: 20) {
                        Button(action: {
                            let typeLocationMapping = ["Restaurant", "Station", "Hotel"]
                            let selectedTypeString = typeLocationMapping[selectedTypelocation]
                            let typeChargeMapping = ["Gratuit", "Payé"]
                            let selectedChargeString = typeChargeMapping[selectedTypeParking]


                            let newLocation = Location(
                                name: name,
                                cityName: cityname,
                                address: address,
                                typeLocation: selectedTypeString,
                                typeCharge: selectedChargeString,
                                picture: picture,
                                coordinate: Location.Coordinate(
                                        latitude: Double(latitude) ?? 0.0,
                                        longitude: Double(longitude) ?? 0.0
                                    )
                            )

                            vm.addLocation(newLocation)
                        }) {
                            Text("Ajouter l'emplacement")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationTitle("Ajouter une borne")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // Helper methods to map selected types to the expected server values
}

struct AddBorneView_Previews: PreviewProvider {
    static var previews: some View {
        AddBorneView()
    }
}
