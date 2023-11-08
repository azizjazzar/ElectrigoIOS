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
        NavigationView{
            VStack {
                MapflotteViewRepresentable()
                    .ignoresSafeArea()
                NavigationLink(destination: ArrivedView()) {
                    Text("Start")
                }
                .frame(width: 350, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                
                .foregroundColor(.white)
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SendView())
                    {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}
    
struct MapflotteView_Previews: PreviewProvider {
    static var previews: some View {
        MapflotteView()
    }
}
