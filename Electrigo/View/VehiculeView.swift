import SwiftUI

struct VehiculeView: View {
    @State private var selectedTab = 0 // Assurez-vous que cette variable est dans
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    let vehicules: [Véhicule] = [ // Remplacez par vos données de véhicules
        Véhicule(id: 1, marque: "Ford", modele: "Ford F-150", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1" ,descriptionV:"Le modèle Ford A4 est équipé de la toute dernière technologie de sécurité avancée, offrant une tranquillité d'esprit totale à ses conducteurs. Avec des fonctionnalités telles que le système de freinage automatique d'urgence, l'assistance au maintien de voie, et les airbags latéraux, la sécurité est une priorité absolue."),
        Véhicule(id: 2, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "bmw" ,imagelogo: "fordlogo" ,priceday: "160" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 3, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "jeep" ,imagelogo: "fordlogo" ,priceday: "170" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 4, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 5, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 6, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        Véhicule(id: 7, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6,3kwh", boite: "Automatique", nombreDePlaces: 5, image: "ford" ,imagelogo: "fordlogo" ,priceday: "150" ,userphoto: "user1",descriptionV:"adem"),
        
    ]
    
    
    struct LogoListView: View {
        let logos: [String] = ["fordlogo", "logobmw", "logojeep", "logofiat"] // Remplacez ceci par vos noms de logos

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                    ForEach(logos, id: \.self) { logo in
                        Button(action: {
                            // Ajoutez ici la logique de filtrage en fonction du logo sélectionné
                        }) {
                            Image(logo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(10)
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
                        LogoListView()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color.blue.opacity(0.5))
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(vehicules, id: \.id) { vehicule in
                                    NavigationLink(
                                        destination: DetailsVehiculeView(),
                                        label: {
                                            VehiculeCardView(vehicule: vehicule)
                                        }
                                    )
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }

                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .foregroundColor(Color.blue.opacity(0.5))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(vehicules, id: \.id) { vehicule in
                                    NavigationLink(
                                        destination: DetailsVehiculeView(),
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
    
    struct VehiculeCardView: View {
        let vehicule: Véhicule
        
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

                
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) { item in
                        Image("star")
                    }
                    Spacer()
                    Text("$\(vehicule.priceday)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .frame(width: 210)
            .padding()
            .background(Color.blue.opacity(0.3))
            .cornerRadius(20.0)
        }
    }

    
    
    struct AppBarView: View {
        var body: some View {
            HStack {
                Button(action: {}) {
                    Image("menu")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(uiImage: #imageLiteral(resourceName: "Profile"))
                        .resizable()
                        .frame(width: 42, height: 42)
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
        }
    }
    
    
    struct TagLineView: View {
        var body: some View {
            Text("Trouvez les \nmeilleures ")
                .font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color.blue.opacity(0.5))
            + Text("Voitures!")
                .font(.custom("PlayfairDisplay-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color.blue.opacity(0.5))
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                        )
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
    
  
    
    //image random slide
    struct ImageSliderView: View {
        
        @State private var currentIndex = 0
        var slides: [String] = ["ford", "bmw", "golf", "jeep", "user1"]
        var isNewBadgeVisible: Bool = true // Vous pouvez activer ou désactiver en fonction de vos besoins
        
        var body: some View {
            
            ZStack(alignment: .topTrailing) {
                
                ZStack(alignment: .trailing){
                    
                    Image(slides[currentIndex])
                        .resizable()
                        .frame(width: .infinity, height: 120)
                        .scaledToFit()
                        .cornerRadius(15)
                    
                    if isNewBadgeVisible {
                        Text("New")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .background(Color.red)
                            .padding(4)
                            .cornerRadius(8)
                            .position(x: 20, y: 16)
                            .position(x: 20, y: 16)
                    }
                }
                
                HStack{
                    ForEach(0..<slides.count) { index in
                        Circle()
                            .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding()
            }
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                    if self.currentIndex + 1 == self.slides.count {
                        self.currentIndex = 0
                    } else {
                        self.currentIndex += 1
                    }
                }
            }
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

