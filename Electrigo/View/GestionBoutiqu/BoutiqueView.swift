//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI


struct BoutiqueView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isMenuVisible: Bool = false


    
    
 
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView (isMenuVisible: $isMenuVisible)
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i].nom)
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Populaire")
                            .font(Font.custom("GillSans", size: 20))
                            .padding(.horizontal)
                            .foregroundColor(.black)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< produits.count) { i in
                                    NavigationLink(
                                           destination: DetailProduit(produit: produits[i]),
                                           label: {
                                               ProductCardView(produit: produits[i], size: 210)
                                           })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Meuilleurs")
                            .font(Font.custom("GillSans", size: 20))
                            .padding(.horizontal)
                            .foregroundColor(.black)
                           
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(2 ..< produits.count) { i in
                                    ProductCardView(produit: produits[i], size: 210)
                                }
                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                  //  BarDeNavigationView()
                }
            }
        }
//        .navigationBarTitle("") //this must be empty
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct BoutiqueView_Previews: PreviewProvider {
    static var previews: some View {
        BoutiqueView()
    }
}

struct AppBarView: View {
    @Binding var isMenuVisible: Bool
    @State private var isProfileVisible = false // Pour afficher la vue des paramètres du profil

    var body: some View {
        HStack {
            Button(action: {
                isMenuVisible.toggle()
            }) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            .sheet(isPresented: $isMenuVisible) {
                NavigationView {
                    ProduitFormView()
                }
            }

            Spacer()

            Button(action: {
                isProfileVisible.toggle()
            }) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $isProfileVisible) {
                UserSetings()
            }
        }
        .padding(.horizontal)
    }
}


struct TagLineView: View {
    @State private var isFindVisible = false
    @State private var isProductsVisible = false

    var body: some View {
        HStack {
            Spacer() // Ajoute un espace à gauche

            VStack {
                Text("Trouver Les Meilleurs ")
                    .font(Font.custom("GillSans-Bold", size: 20))
                    .foregroundColor(Color("Primary"))
                    .opacity(isFindVisible ? 1 : 0)
                
                Text("Produits !")
                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .opacity(isProductsVisible ? 1 : 0)
            }
            .multilineTextAlignment(.center) // Centrer horizontalement

            Spacer() // Ajoute un espace à droite
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { timer in
                withAnimation(.easeInOut(duration: 0.5)) {
                    isFindVisible.toggle()
                }

                withAnimation(.easeInOut(duration: 0.5).delay(0.5)) {
                    isProductsVisible.toggle()
                }
            }
        }
    }
}





struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Chercher Votre Produit ", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
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

struct ProductCardView: View {
    let produit: Produit
    let size: CGFloat
    
    var body: some View {
        VStack {
            Image(produit.nom)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(produit.nom)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< produit.rating) { item in
                    Image("star")
                }
                Spacer()
                Text(String(format: "%.2f TND", produit.prix))
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

// ... (votre code précédent)







