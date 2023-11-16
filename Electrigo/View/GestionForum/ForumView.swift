import SwiftUI






struct PostDetailView: View {
    @State private var newComment: String = ""
    @State private var post: Post
    @State private var isCommentAdded = false

    init(post: Post) {
        self._post = State(initialValue: post)
    }

    var body: some View {
        VStack {
            ScrollView {
                Image(post.userr.userrImageName)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(30)
                    .padding()

                Text(post.userr.userrname)
                    .font(.title)
                    .foregroundColor(.blue)

                Text(post.date)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text(post.category)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text(post.description)
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .opacity(1)
                    .padding(.horizontal)
                    .lineLimit(nil)

                TextField("Ajouter un commentaire", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    post.comments.append(Comment(text: newComment))
                    newComment = ""
                    isCommentAdded = true
                }) {
                    Text("Ajouter un commentaire")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                if isCommentAdded {
                    Text("Commentaire ajouté avec succès!")
                        .foregroundColor(.green)
                        .padding()
                }

                // Liste des commentaires
                ForEach(post.comments) { comment in
                    CommentView(comment: comment)
                        .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle("Detail de la publication")
        .padding(.top, 10)
    }
}








struct CommentView: View {
    @State private var newReply: String = ""
    @ObservedObject var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(comment.text)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }

            ForEach(comment.replies) { reply in
                VStack(alignment: .leading, spacing: 8) {
                    Divider().padding(.leading, 8) // Ajout de la séparation
                    CommentView(comment: reply)
                        .padding(.leading, 16)
                }
            }

            Button(action: {
                // Ajoutez la réponse au commentaire
                let newReplyComment = Comment(text: newReply)
                comment.replies.append(newReplyComment)
                newReply = ""
            }) {
                Text("Répondre")
                    .foregroundColor(.blue)
            }
            .padding(.leading, 8)

            TextField("Votre réponse", text: $newReply)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing], 8)
                .padding(.bottom, 8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}















struct ContentView: View {
    var userr1: Userr
    var userr2: Userr
    var userr3: Userr
    var userr4: Userr

    var posts: [Post]

    @State private var selectedCategory: String = "Tout" // Catégorie par défaut

    init() {
        userr1 = Userr(userrname: "Idriss ", userrImageName: "user1")
        userr2 = Userr(userrname: "Aziz ", userrImageName: "user2")
        userr3 = Userr(userrname: "Hamza", userrImageName: "user3")
        userr4 = Userr(userrname: "Dhia", userrImageName: "user4")

        posts = [
            Post(userr: userr1, description: "Que pensez vous de la tesla ", date: "06 Nov 2023", category: "Voitures", comments: [
                Comment(text: "C'est une voiture incroyable!"),
                Comment(text: "J'aimerais en avoir une un jour.")
            ]),
            Post(userr: userr2, description: "instalation borne totale", date: "07 Nov 2023", category: "Bornes", comments: [
                Comment(text: "Je suis intéressé par l'installation d'une borne de recharge à la maison. Quelqu'un a des recommandations?")
            ]),
            Post(userr: userr3, description: "Où puis-je acheter un chargeur?", date: "08 Nov 2023", category: "Autre", comments: [
                Comment(text: "Vous pouvez vérifier dans les magasins d'électronique locaux."),
                Comment(text: "En ligne, il y a aussi plusieurs options disponibles.")
            ]),
            Post(userr: userr4, description: "Description du quatrième post", date: "09 Nov 2023", category: "Autre", comments: [
                Comment(text: "C'est un post intéressant!"),
                Comment(text: "J'attends de voir plus de discussions sur ce sujet.")
            ]),
            // Ajoutez plus de publications ici avec différents utilisateurs et commentaires
        ]
    }

    var filteredPosts: [Post] {
        if selectedCategory == "Tout" {
            return posts
        } else {
            return posts.filter { $0.category == selectedCategory }
        }
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
                .edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    Text("Forum")
                        .font(.largeTitle)
                        .padding(.top, 1)

                    Picker("Catégorie", selection: $selectedCategory) {
                        Text("Tout").tag("Tout")
                        Text("Voitures").tag("Voitures")
                        Text("Bornes").tag("Bornes")
                        Text("Autre").tag("Autre")
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    ScrollView {
                        ForEach(filteredPosts, id: \.description) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {
                                VStack {
                                    PostRow(post: post)
                                        .padding(.horizontal)
                                    Divider()
                                }
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    }

                    NavigationLink(destination: AddPostView()) {
                        Image(systemName: "pencil.circle.fill")
                                                .font(.system(size: 60))
                                                .foregroundColor(Color.blue)
                                            }
                                            .padding()
                                        }
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                    }
                                }
                            }
                        }











                        struct CategoryIcon: View {
                            var name: String

                            var body: some View {
                                VStack {
                                    Image(name)
                                        .resizable()
                                        .frame(width: 50, height: 20)
                                    Text(name)
                                        .font(.caption)
                                }
                                .padding(10)
                            }
                        }









                        struct PostRow: View {
                            var post: Post

                            var body: some View {
                                NavigationLink(destination: PostDetailView(post: post)) {
                                    HStack {
                                        Image(post.userr.userrImageName)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(25)

                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(post.userr.userrname)
                                                    .font(.caption)
                                                    .foregroundColor(.blue)
                                                Text(post.category)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                            Text(post.description)
                                                .font(.body)
                                                .foregroundColor(.black)
                                                .opacity(0.8)
                                                .lineLimit(2) // Show only 2 lines of the description
                                        }

                                        Spacer()

                                        VStack {
                                            Text(post.date)
                                                .font(.caption)
                                                .foregroundColor(.gray)

                                            HStack(spacing: 10) {
                                                Button(action: {
                                                    // Ajoutez l'action d'upvote ici
                                                }) {
                                                    Image(systemName: "arrow.up.circle")
                                                        .font(.system(size: 20))
                                                }
                                                Button(action: {
                                                    // Ajoutez l'action de downvote ici
                                                }) {
                                                    Image(systemName: "arrow.down.circle")
                                                        .font(.system(size: 20))
                                                }
                                                Button(action: {
                                                    // Ajoutez l'action pour afficher les commentaires ici
                                                }) {
                                                    Image(systemName: "message.circle")
                                                        .font(.system(size: 20))
                                                }
                                            }
                                        }
                                    }
                                    .padding(10)
                                }
                            }
                        }










                        struct ElectrigoApp_Previews: PreviewProvider {
                            static var previews: some View {
                                ContentView()
                            }
                        }








                        struct AddPostView: View {
                            @State private var newPostDescription: String = ""
                            @State private var selectedCategory: String = "Voitures"
                            @State private var showAlert = false
                            @State private var publicationAddedSuccessfully = false
                            @State private var navigateToContentView = false

                            var body: some View {
                                NavigationView {
                                    VStack {
                                        Text("Ajouter une publication")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .padding(.top, 20)
                                        
                                        Picker("Catégorie", selection: $selectedCategory) {
                                            Text("Voitures").tag("Voitures")
                                            Text("Bornes").tag("Bornes")
                                            Text("Autre").tag("Autre")
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                                        .background(Color.blue.opacity(0.3))
                                        .padding()
                                        
                                        // Use a multiline TextField for the description
                                        TextEditor(text: $newPostDescription)
                                            .frame(height: 100) // Adjust the height as needed
                                            .padding()
                                            .background(Color.blue.opacity(0.3))
                                            .cornerRadius(10)
                                        
                                        Button(action: {
                                            showAlert = true
                                            // Add your code to save the new publication here
                                        }) {
                                            HStack {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .font(.title)
                                                Text("Ajouter")
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                            }
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                        }
                                        .padding()
                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Êtes-vous sûr de vouloir poster cette publication?"),
                                                message: Text("Votre nouvelle publication sera enregistrée."),
                                                primaryButton: .default(Text("Annuler")),
                                                secondaryButton: .default(Text("OK")) {
                                                    publicationAddedSuccessfully = true
                                                    navigateToContentView = true
                                                }
                                            )
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal, 20)
                                    .background(
                                        NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                                            EmptyView()
                                        }
                                        .hidden()
                                    )
                                }
                            }
                        }


