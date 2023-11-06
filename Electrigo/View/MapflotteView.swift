//
//  MapflotteView.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapflotteView: View {
    var body: some View {
        VStack {
            MapflotteViewRepresentable()
                .ignoresSafeArea()
            NavigationLink(destination: ArrivedView()) {
            Text("OK") 
            }
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            
            .foregroundColor(.white)
            
        }
    }
}
    
struct MapflotteView_Previews: PreviewProvider {
    static var previews: some View {
        MapflotteView()
    }
}
