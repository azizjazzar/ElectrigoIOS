//
//  ForumView.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//

import SwiftUI

struct ForumView: View {
    private let forum: [Forum] = [
        Forum(authorName: "Dhia Aissa",
              authorUsername: "dhia_patron",
              timestampText: "4h",
              text: "good morning 🌞",
              numberOfReplies: 2,
              numberOfRetweets: 3,
              numberOfLikes: 8),
        Forum(authorName: "Hamza",
              authorUsername: "hamza",
              timestampText: "15h",
              text: "just setting up my twitter",
              numberOfReplies: 5,
              numberOfRetweets: 3,
              numberOfLikes: 4),
        Forum(authorName: "Aziz Jazzar",
              authorUsername: "realDonaldTrump",
              timestampText: "6h",
              text: "Despite the negative press covfefe",
              numberOfReplies: 2,
              numberOfRetweets: 45,
              numberOfLikes: 89),
        Forum(authorName: "adem",
              authorUsername: "samir",
              timestampText: "15h",
              text: "this is a tweet with a lot of text because I need to test multi-line tweets in my new SwiftUI twitter app :)",
              numberOfReplies: 5,
              numberOfRetweets: 3,
              numberOfLikes: 45)
    ]

    var body: some View {
        NavigationView {
            List(forum) { forum in
                ForumItemView(forum: forum)
            }
            .navigationTitle("Forum")
        }
    }

}

struct ForumItemView: View {
    let forum: Forum

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 55))
                .padding(.top)
                .padding(.trailing, 5)

            VStack(alignment: .leading) {
                HStack {
                    Text(forum.authorName)
                        .bold()
                        .lineLimit(1)
                    Text("@\(forum.authorUsername) • \(forum.timestampText)")
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)

                Text(forum.text)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)

                ForumActionsView(forum: forum)
                    .foregroundColor(.gray)
                    .padding([.bottom, .top], 10)
                    .padding(.trailing, 30)
            }
        }
    }
}

struct ForumActionsView: View {
    let forum: Forum

    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.up.circle")
            }
            Text(forum.numberOfReplies > 0 ? "\(forum.numberOfReplies)" : "")
            Spacer()

            Button(action: {}) {
                Image(systemName: "arrow.down.circle")
            }
            Text(forum.numberOfRetweets > 0 ? "\(forum.numberOfRetweets)" : "")
            Spacer()

            Button(action: {}) {
                Image(systemName: "message")
            }
            Text(forum.numberOfLikes > 0 ? "\(forum.numberOfLikes)" : "")
            Spacer()

            Button(action: {}) {
                Image(systemName: "square.and.arrow.up")
            }
        }
    }
}



struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}

