import SwiftUI



struct ForumView: View {
    @State private var selectedTopic = "Tous" // Le sujet sélectionné par défaut
    private let topics = ["Tous", "Voiture", "Borne",  "Technologie", "Autre"]
    
    private let forum: [Forum] = [
        Forum(authorName: "Dhia ",
              authorUsername: "dhia_patron",
              timestampText: "4h",
              text: "good morning 🌞",
              numberOfUpvote: 2,
              numberOfDownvote: 3,
              numberOfComments: 8),
        Forum(authorName: "Hamza",
              authorUsername: "hamza",
              timestampText: "15h",
              text: "just setting up my twitter",
              numberOfUpvote: 5,
              numberOfDownvote: 3,
              numberOfComments: 4),
        Forum(authorName: "Aziz ",
              authorUsername: "realDonaldTrump",
              timestampText: "6h",
              text: "Despite the negative press covfefe",
              numberOfUpvote: 2,
              numberOfDownvote: 45,
              numberOfComments: 89),
        Forum(authorName: "adem",
              authorUsername: "samir",
              timestampText: "15h",
              text: "test :)",
              numberOfUpvote: 5,
              numberOfDownvote: 3,
              numberOfComments: 45)
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
                    List(forum.filter { $0.authorName == "Dhia " }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Voiture")
                } else if selectedTopic == "Borne" {
                    List(forum.filter { $0.authorName == "Hamza" }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Borne")
                } else if selectedTopic == "Autre" {
                    List(forum.filter { $0.authorName == "Aziz " }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Autre")
                } else if selectedTopic == "Technologie" {
                    List(forum.filter { $0.authorName == "adem" }) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum - Technologie")

                } else {
                    List(forum) { forum in
                        ForumItemView(forum: forum)
                    }
                    .navigationTitle("Forum")
                }

                NavigationLink(destination: CommentsView()) {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
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
                .font(.system(size: 40))
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
                        .padding([.bottom, .top], 0)
                        .padding(.trailing, 50)

                NavigationLink(destination: PostDetailView(forum: forum, numberOfUpvote: forum.numberOfUpvote, numberOfDownvote: forum.numberOfUpvote)) {
                    Image(systemName: "")
                
                        .font(.system(size: 16))
                        .padding(5)
                        .background(Color.white)
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
            Text(forum.numberOfUpvote > 0 ? "\(forum.numberOfUpvote)" : "")
            Spacer()

            Button(action: {}) {
                Image(systemName: "arrow.down.circle")
            }
            Text(forum.numberOfDownvote > 0 ? "\(forum.numberOfDownvote)" : "")
            Spacer()

            Button(action: {}) {
                Image(systemName: "message")
            }
            Text(forum.numberOfComments > 0 ? "\(forum.numberOfComments)" : "")
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
