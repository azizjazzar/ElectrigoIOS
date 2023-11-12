//
//  LocationReviewForm.swift
//  Electrigo
//
//  Created by Aissa Dhia on 12/11/2023.
//

import SwiftUI

struct LocationReviewForm: View {
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
        VStack(alignment: .leading, spacing: 16) {
            Text("Add a review")
                .font(.title)
                .padding(.top, 10)

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
            .padding(.vertical, 10)

            Text("Add a Comment:")
                .font(.headline)

            TextEditor(text: $comment)
                        .frame(height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.black, lineWidth: 2)
                               
                        )
                        .padding(.vertical, 8)
                .padding(.vertical, 8)
            Button(action: submitReview) {
                Text("Submit Review")
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 4)
            }
            .padding(.horizontal, 20)
            Spacer() // Move the VStack to the top

          
        }
        .padding()
    }

    private func submitReview() {
        // Handle the review submission, for example, send it to a server
        if let rating = rating {
            print("Rating: \(rating), Comment: \(comment)")
            // You can add further logic like sending data to a server, updating UI, etc.
        } else {
            // Handle the case where the user hasn't selected a rating
            print("Please select a rating.")
        }
    }
}

struct LocationReviewForm_Previews: PreviewProvider {
    static var previews: some View {
        LocationReviewForm(rating: .constant(3))
    }
}
