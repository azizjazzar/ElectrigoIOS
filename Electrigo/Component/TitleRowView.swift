//
//  TitleRowView.swift
//  Electrigo
//
//  Created by hamza farhani on 6/11/2023.
//

import SwiftUI

struct TitleRowView: View {
    let imageUrl = URL(string: "https://images.app.goo.gl/Q8KktzR2j4nE8X8C8")
    let name = "maintenance"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 50, height: 50)
                     .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack (alignment: .leading) {
               Text(name)
                .font(.title).bold()
               Text("Online")
                .font(.caption)
                .foregroundColor(.green)
        }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Image(systemName: "message")
                .foregroundColor(.gray)
                    
             
        }
    }
}
struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        TitleRowView()
    }
}
