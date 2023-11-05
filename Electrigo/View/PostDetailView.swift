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
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .foregroundColor(.blue)

            Text(forum.authorName)
                .bold()
                .font(.title)
                .foregroundColor(.blue)

            HStack(spacing: 20) {
                Text("Upvote: \(numberOfReplies)")
                    .padding()
                    .foregroundColor(.gray)
                Text("DownVote: \(numberOfRetweets)")
                    .padding()
                    .foregroundColor(.gray)
            }
            .padding(.top, 40)

            Text(forum.text)
                .padding()
                .foregroundColor(.black)

            HStack(spacing: 20) {
                Image(systemName: "message")
                Image(systemName: "heart")
                Image(systemName: "square.and.arrow.up")
            }
            .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("Detail")
    }
}
