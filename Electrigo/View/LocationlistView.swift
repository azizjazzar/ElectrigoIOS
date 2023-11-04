//
//  LocationlistView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import SwiftUI

struct LocationlistView: View {
    @EnvironmentObject var vm: locationlistViewModel

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
                                Button(action: {
                                    // Your button action here
                                }) {
                                    Text("22Km").foregroundColor(.green).background(RoundedRectangle(cornerRadius: 2).stroke(Color.green, lineWidth: 1)).padding(.vertical, 3)
                                    
                                        
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
                    Button(action: {
                        // Your back button action here
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
        }
    }
}





struct LocationlistView_Previews: PreviewProvider {
    static var previews: some View {
        LocationlistView().environmentObject(locationlistViewModel())
    }
}
