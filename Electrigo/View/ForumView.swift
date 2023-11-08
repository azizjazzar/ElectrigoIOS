import SwiftUI


struct PostDetailView: View {
    @State private var newComment: String = ""
    @State private var post: Post
    @State private var isCommentAdded = false

    init(post: Post) {
        self._post = State(initialValue: post)
    }

    var body: some View {
        ZStack {
            Image("b") // Assurez-vous de remplacer "backgroundImage" par le nom de votre image dans Assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                Image(post.user.userImageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding()

                Text(post.user.username)
                    .font(.title)
                    .foregroundColor(.blue)

                Text(post.description)
                    .font(.body)
                    .foregroundColor(.black)
                    .opacity(1)
                    .padding(.horizontal)

                Text(post.date)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text(post.category)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                // Champ pour écrire un nouveau commentaire
                TextField("Ajouter un commentaire", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Bouton pour ajouter un commentaire
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

                // Afficher le message après l'ajout du commentaire
                if isCommentAdded {
                    Text("Commentaire ajouté avec succès!")
                        .foregroundColor(.green)
                        .padding()
                }

                // Liste des commentaires
                List {
                    ForEach(post.comments, id: \.text) { comment in
                        Text(comment.text)
                    }
                }
            }
        }
        .navigationBarTitle("Post Detail")
        .padding(.top, 10)
    }
}

struct ContentView: View {
    var user1: User
    var user2: User
    var user3: User
    var user4: User

    var posts: [Post]

    @State private var selectedCategory: String = "Tout" // Catégorie par défaut

    init() {
        user1 = User(username: "Idirss ", userImageName: "user1")
        user2 = User(username: "Aziz ", userImageName: "user2")
        user3 = User(username: "Hamza", userImageName: "user3")
        user4 = User(username: "Dhia", userImageName: "user4")

        posts = [
            Post(user: user1, description: "Que pensez vous de la tesla ", date: "06 Nov 2023", category: "Voitures", comments: []),
            Post(user: user2, description: "instalation borne totale", date: "07 Nov 2023", category: "Bornes", comments: []),
            Post(user: user3, description: "ou je peux acheter un chargeur ", date: "08 Nov 2023", category: "Autre", comments: []),
            Post(user: user4, description: "Description du quatrieme post", date: "09 Nov 2023", category: "Autre", comments: []),
            
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
                                PostRow(post: post)
                            }
                        }
                    }

                    NavigationLink(destination: AddPostView()) {
                        Text("Ajouter une publication")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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
        HStack {
            Image(post.user.userImageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(25)

            VStack(alignment: .leading) {
                HStack {
                    Text(post.user.username)
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
            }

            Spacer()

            VStack {
                Text(post.date)
                    .font(.caption)
                    .foregroundColor(.gray)

                HStack(spacing: 1) {
                    Button(action: {
                        // Ajoutez l'action d'upvote ici
                    }) {
                        Image(systemName: "arrow.up.circle")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        // Ajoutez l'action de downvote ici
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        // Ajoutez l'action pour afficher les commentaires ici
                    }) {
                        Image(systemName: "message.circle")
                            .font(.system(size: 30))
                    }
                }
            }
        }
        .padding(10)
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
    @State private var showAlert = false // Ajoutez cet état pour contrôler l'affichage de l'alerte

    var body: some View {
        VStack {
            Text("Ajouter une publication")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20) // Ajustez cette valeur pour déplacer la vue vers le haut
            
            Picker("Catégorie", selection: $selectedCategory) {
                Text("Voitures").tag("Voitures")
                Text("Bornes").tag("Bornes")
                Text("Autre").tag("Autre")
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.blue.opacity(0.3))
            .padding()
            
            TextField("Description de la publication", text: $newPostDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
           
            
            Button(action: {
                showAlert = true                // Ajoutez votre code pour enregistrer la nouvelle publication ici
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
                                title: Text("Publication ajoutée"),
                                message: Text("Votre nouvelle publication a été enregistrée avec succès."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
            
            
            Spacer() // Ajoute un espace supplémentaire en bas pour centrer le contenu
        }
        .navigationBarTitle("Ajout de Publication")
        .padding(.horizontal, 20)
    }
}
