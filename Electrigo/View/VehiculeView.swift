import SwiftUI

struct VehiculeView: View {
    @State private var selectedTab = 0 // Assurez-vous que cette variable est dans
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var selectedLogo: String?

    let vehicules: [Véhicule] = [ // Remplacez par vos données de véhicules
        Véhicule(id: 1, marque: "audi", modele: "Ford F-150", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "audi" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1" ,descriptionV:"Le modèle Ford A4 est équipé de la toute dernière technologie de sécurité avancée, offrant une tranquillité d'esprit totale à ses conducteurs. Avec des fonctionnalités telles que le système de freinage automatique d'urgence, l'assistance au maintien de voie, et les airbags latéraux, la sécurité est une priorité absolue."),
        Véhicule(id: 2, marque: "cupra", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "cupra" ,imagelogo: "fordlogo" ,priceday: "160" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 3, marque: "mercedes", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "mercedes" ,imagelogo: "fordlogo" ,priceday: "170" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 4, marque: "porche", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "porche" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 5, marque: "ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 6, marque: "polestera", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "polestera" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 7, marque: "renaut", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "renaut" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 8, marque: "tesla", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "tesla" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
    ]






                    // Le reste de votre AppBarView
                
    struct LogoListView: View {
        let logos: [String] = ["logoferrari", "logotesla", "logocupra", "logocitroen", "logopeugeot", "logonissan", "logoaudi", "lgomini", "logoseat"]
    

        @Binding var selectedLogo: String?
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                    Button(action: {
                        selectedLogo = nil // Afficher tous les véhicules
                    }) {
                        Text("Tous")
                    }
                    
                    ForEach(0..<logos.count, id: \.self) { index in
                        let logo = logos[index]
                        

                        Button(action: {
                            selectedLogo = logo // Sélectionnez le logo
                        }) {
                            ZStack {
                                Image(logo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                                // Ajustez la position de l'image de l'utilisateur
                            }
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
        }
    }


    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                      
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        LogoListView(selectedLogo: $selectedLogo)

                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                
                            }
                            .padding()
                        }
                        
                        Text("Populaire")
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .padding(.horizontal)
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(vehicules, id: \.id) { vehicule in
                                    if selectedLogo == nil || selectedLogo == vehicule.marque.lowercased() {
                                        NavigationLink(
                                            destination: DetailScreen(),
                                            label: {
                                                VehiculeCardView(vehicule: vehicule)
                                            }
                                        )
                                    }
                                }


                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Nos nouvelles voitures")
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .foregroundColor(Color.black.opacity(0.9))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(vehicules, id: \.id) { vehicule in
                                    NavigationLink(
                                        destination: DetailScreen(),
                                        label: {
                                            VehiculeCardView(vehicule: vehicule)
                                        }
                                    )

                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
        }
    }
    

    //card view
    struct VehiculeCardView: View {
        let vehicule: Véhicule
        let userImages: [String] = ["user1", "user1", "user1", "user1", "user1", "user1", "user1", "user1"]

        var body: some View {
            VStack {
                Image(vehicule.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20.0)

                Text(vehicule.marque)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 4) // Ajoute un espace au-dessus du texte

                HStack {
                    Spacer()
                    Text("$\(vehicule.priceday)")
                        .font(.custom("PlayfairDisplay-Bold", size: 20))
                        .fontWeight(.bold)
                        .offset(x: -105, y: -15)
                        
                    Text("/day")
                        .font(.custom("PlayfairDisplay-Bold", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .offset(x: -110, y: -15)
                }
            }
            .frame(width: 210)
            .padding(1) // Réduit l'espace entre la cellule et le contour bleu
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.blue.opacity(0.4), radius: 4, x: 0, y: 10) // Ajoute une ombre en bas pour l'effet 3D
            )
            .overlay(
                Image(userImages[vehicule.id - 1])
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20.0)
                    .offset(x: 70, y: 72)
            )
        }
    }


    
    
    struct AppBarView: View {
        @State private var isVehiculeForumViewPresented = false // Ajoutez un état pour contrôler la présentation de la page VehiculeForumView

        var body: some View {
            HStack {
                Button(action: {}) {
                    Image("menu")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                }

                Spacer()

                Button(action: {
                    isVehiculeForumViewPresented.toggle() // Activez la présentation de la page VehiculeForumView
                }) {
                    Image(systemName: "plus")
                        .font(.title) // Utilisez une icône "+" de système
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isVehiculeForumViewPresented) {
                    VehiculeForumView() // Utilisez NavigationLink pour présenter la page VehiculeForumView
                }
            }
            .padding(.horizontal)
        }
    }

    
    
    struct TagLineView: View {
        var body: some View {
            Text("Trouvez les \nmeilleures ")
                .font(.custom("PlayfairDisplay-Regular", size: 22))
                .foregroundColor(Color.black.opacity(0.5))
            + Text("Voitures!")
                .font(.custom("PlayfairDisplay-Bold", size: 26))
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
        }
    }
    
    struct SearchAndScanView: View {
        @Binding var search: String
        
        var body: some View {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                        .foregroundColor(.blue)
                    TextField("Rechercher des voitures...", text: $search)
                        .padding(.all, 20)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .padding(.trailing, 8)
                        
                }
            }
            .padding(.horizontal)
        }
    }

    
    struct CategoryView: View {
        let isActive: Bool
        let text: String
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
                if (isActive) { Color("Primary")
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
    
  
    
   
    
    
    struct BottomNavBarItem: View {
        let image: Image
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                image
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    
    struct BottomNavBarView: View {
        var body: some View {
            HStack {
                BottomNavBarItem(image: Image("Home"), action: {})
                BottomNavBarItem(image: Image("fav"), action: {})
                BottomNavBarItem(image: Image("shop"), action: {})
                BottomNavBarItem(image: Image("User"), action: {})
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
        }
    }
    
    
    
    
    struct UserSetingsView_Previews: PreviewProvider {
        static var previews: some View {
            VehiculeView()
        }
    }
    
}

