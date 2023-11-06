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
        
            MapflotteViewRepresentable()
            .ignoresSafeArea()
            
            
        }
    }

    
struct MapflotteView_Previews: PreviewProvider {
    static var previews: some View {
        MapflotteView()
    }
}
