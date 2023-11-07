//
//  ListLocationMapView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 7/11/2023.
//

import SwiftUI

struct ListLocationMapView: View {
    @EnvironmentObject var vm: locationlistViewModel
    let location : Location
    
    
    
    var body: some View {
        HStack{
            Image(systemName: "location.circle")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40,height: 40,alignment: .center)
                .cornerRadius(20)
            VStack{
                Text(location.name)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .padding(.leading)
                
                Text(location.cityName)
                    .font(.system(size: 16, weight: .regular, design: .serif))
                    .padding(.leading)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)){
                vm.updateCoordinateRegion(location: location)
            }
        }
    }
    
    struct ListLocationMapView_Previews: PreviewProvider {
        static let vm = locationlistViewModel()
        static var previews: some View {
            ListLocationMapView(location:vm.locations.first!).environmentObject(locationlistViewModel())
        }
    }
}
