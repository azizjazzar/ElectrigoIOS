//
//  BarDeNavigationView.swift
//  Electrigo
//
//  Created by aziztemimi on 9/11/2023.
//

import SwiftUI

struct BarDeNavigationView: View {
    
    @State private var selectedTab = 0 // Initialize selectedTab to 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
              ContentView().tabItem {
                    Image(systemName: "house")
                }.tag(0)

                Text("Dhia").tabItem {
                    Image(systemName: "location.fill")
                }.tag(1)

                VehiculeView().tabItem {
                    Image(systemName: "car.fill")
                }.tag(2)

                BoutiqueView().tabItem {
                    Image(systemName: "cart.fill")
                }.tag(3)

                UserSetings().tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }.tag(4)
            }
            .accentColor(.blue)
        }
        .navigationBarTitle(" ")   }
}


struct BarDeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BarDeNavigationView()
    }
}
