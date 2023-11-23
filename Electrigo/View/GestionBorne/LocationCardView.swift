//
//  LocationCardView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 18/11/2023.
//

import SwiftUI

struct LocationCardView: View {
    let location : Location
    @StateObject var vl = locationlistViewModel()
    var body: some View {
        HStack{
            VStack{
                Text(location.name)
                    .font(.system(size: 17, weight: .medium, design: .serif))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text(location.cityname)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text(location.typelocation)
                        .font(.system(size: 14, weight: .semibold, design: .serif))
                        .padding()
                        .background(Color(uiColor: vl.getColorFromType(type: location.typelocation)).opacity(0.8))
                       
                        .foregroundColor(.black)
                        .cornerRadius(22)
            }.padding(.horizontal,10)
            Image(systemName: "location.circle")
                .resizable()
                .foregroundColor((Color(uiColor: vl.getColorFromType(type: location.typelocation)).opacity(0.8)))
                .scaledToFill()
                .frame(width: 30 ,height: 30, alignment: .center)
                .padding(.trailing)
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 25).stroke(Color(uiColor: vl.getColorFromType(type: location.typelocation)).opacity(0.8), lineWidth: 1))
        .padding(.vertical, 5)

        .cornerRadius(12)
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var vl = locationlistViewModel()
    static var previews: some View {
        LocationCardView(location: vl.locations.first!)
    }
}

