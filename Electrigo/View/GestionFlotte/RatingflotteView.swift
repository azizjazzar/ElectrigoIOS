//
//  RatingflotteView.swift
//  Electrigo
//
//  Created by hamza farhani on 12/11/2023.
//

import SwiftUI

struct RatingflotteView: View {
    @Binding var rating: Int?
    @State private var comment: String = ""
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        
            
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: starType(index: index))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            self.rating = index
                        }
            }
        }
    }
}

struct RatingflotteView_Previews: PreviewProvider {
    static var previews: some View {
        RatingflotteView(rating: .constant(5))
    }
}

