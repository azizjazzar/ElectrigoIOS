//
//  PostDetailView.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//
import SwiftUI

struct PostDetailView: View {
    let forum: Forum
    let numberOfReplies: Int
    let numberOfRetweets: Int

    @State private var response = ""

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // Move the image 20 points from the top of the screen.
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .foregroundColor(.blue)
                    .offset(y: -20)

                ScrollView {
                    // Forum author and engagement
                    Section {
                        Text(forum.authorName)
                            .bold()
                            .font(.title)
                            .foregroundColor(.blue)

                        // Reduce the space between the number of replies and the number of retweets with the author name.
                        HStack(spacing: 5) {
                            Text("Upvote: \(numberOfReplies)")
                                .padding()
                                .foregroundColor(.gray)
                            Text("DownVote: \(numberOfRetweets)")
                                .padding()
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 80)
                    }

                    // Forum text
                    Section {
                        Text(forum.text)
                            .padding()
                            .foregroundColor(.black)
                    }

                    // Forum actions
                    Section {
                        HStack(spacing: 20) {
                            Image(systemName: "message")
                            Image(systemName: "heart")
                            Image(systemName: "square.and.arrow.up")
                        }
                        .foregroundColor(.blue)
                    }

                    // Response text field and button
                    Section {
                        // Add a text field for writing a response
                        TextField("Write a response...", text: $response)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)

                        // Add a button to submit the response
                        Button("Submit") {
                            // Submit the response to the server.
                        }
                    }
                }
                .padding()
                .navigationBarTitle("Detail")
            }
        }
    }
}
