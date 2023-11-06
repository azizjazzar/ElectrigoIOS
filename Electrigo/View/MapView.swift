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
    private let locationManager = CLLocationManager()
    var body: some View {
           ZStack(alignment: .bottom) {
               MapViewRepresentable().ignoresSafeArea()
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
               .padding(.bottom, 30)
               .padding(.trailing, 30)
               
            
           }
    
           .fullScreenCover(isPresented: $showLocationList) {
               LocationlistView()
                   .environmentObject(vm) 
           } .navigationBarBackButtonHidden(true)
    }
    
    }

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
