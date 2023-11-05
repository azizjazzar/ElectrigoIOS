import SwiftUI



struct ForumView: View {
    @State private var selectedTopic = "Tous" // Le sujet sélectionné par défaut
    private let topics = ["Tous", "Voiture", "Borne",  "Technologie", "Autre"]
    
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
            VStack {
                Picker("Sujet", selection: $selectedTopic) {
                    ForEach(topics, id: \.self) { topic in
                        Text(topic)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if selectedTopic == "Voiture" {
                    List(forum.filter { $0.authorName == "Dhia Aissa" }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Voiture")
                } else if selectedTopic == "Borne" {
                    List(forum.filter { $0.authorName != "Dhia Aissa" }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Borne")
                } else {
                    List(forum) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum")
                }

                NavigationLink(destination: CommentsView()) {
                    Text("Ajouter un post")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .background(
                Image("b") // Nom de l'image dans vos assets
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
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
                .foregroundColor(.blue)

            VStack(alignment: .leading) {
                HStack {
                    Text(forum.authorName)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(.black)
                    Text("@\(forum.authorUsername) • \(forum.timestampText)")
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.gray)
                }
                .padding(.top, 5)

                Text(forum.text)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)

                ForumActionsView(forum: forum)
                    .foregroundColor(.blue)
                        .padding([.bottom, .top], 10)
                        .padding(.trailing, 30)

                NavigationLink(destination: PostDetailView(forum: forum, numberOfReplies: forum.numberOfReplies, numberOfRetweets: forum.numberOfReplies)) {
                    Image(systemName: "chevron.forward")
                
                        .font(.system(size: 16))
                        .padding(5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
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
