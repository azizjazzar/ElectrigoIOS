//
//  AddBorneView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 6/11/2023.
//

import SwiftUI

struct AddBorneView: View {
    @State private var name: String = ""
    @State private var cityName: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var description: String = ""
    @State private var selectedType: Int = 0
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
                
                Section(header: Text("Type:")) {
                    Picker("Type", selection: $selectedType) {
                        Text("Restaurant").tag(0)
                        Text("Station").tag(1)
                        Text("Hotel").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("City Name:")) {
                    TextField("Example:", text: $cityName)
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
                    Picker("Parking is:", selection: $selectedTypeParking) {
                        Text("Restaurant").tag(0)
                        Text("Station").tag(1)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                VStack {
                    Text("Location Coordinates :")
                        .font(.body)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Section() {
                            TextField("Example:", text: $latitude)
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
                            TextField("Example:", text: $longitude)
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
                
                
                Section {
                    HStack(spacing: 50) {
                        Button(action: {
                            // Action for adding the location
                        }) {
                            Text("Add Location")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color.green)
                                .cornerRadius(8)
                        }

                        Button(action: {
                            // Action for cancel
                        }) {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(12)
                                .background(Color.white)
                                .border(Color.red, width: 1)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationTitle("Add New Location")
        }
    }
}


struct AddBorneView_Previews: PreviewProvider {
    static var previews: some View {
        AddBorneView()
    }
}


