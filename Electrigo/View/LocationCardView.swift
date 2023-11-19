//
//  LocationCardView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 18/11/2023.
//

import SwiftUI

struct LocationCardView: View {
    let location : Location
    var body: some View {
        HStack{
            VStack{
                Text(location.name)
                    .font(.system(size: 17, weight: .medium, design: .serif))
                Text(location.cityname)
                    .font(.system(size: 13, weight: .semibold, design: .serif))
                Text("Type")
                        .font(.system(size: 20, weight: .semibold, design: .serif))
                        .padding()
                        .background(.blue.opacity(0.5))
                        .cornerRadius(22)
            }.padding(.horizontal,10)
            Image(systemName: "location.circle")
                .resizable()
                .foregroundColor(.green)
                .scaledToFill()
                .frame(width: 40 ,height: 40, alignment: .center)
                .padding(.trailing)
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.blue, lineWidth: 1))
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

