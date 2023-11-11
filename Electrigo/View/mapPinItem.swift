//
//  mapPinItem.swift
//  Electrigo
//
//  Created by Aissa Dhia on 7/11/2023.
//

import SwiftUI

struct MapPinItem: View {
    var body: some View {
        VStack {
            Image(systemName: "mappin.circle")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .padding(.bottom, 5) // Adjust as needed
            
        }
    }
}

struct mapPinItem_Previews: PreviewProvider {
    static var previews: some View {
        MapPinItem()
    }
}
