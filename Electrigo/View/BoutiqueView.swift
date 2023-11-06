// BoutiqueView.swift
import SwiftUI

struct BoutiqueView: View {
    @State private var categorieSelectionnee = -1 // Catégorie par défaut est "Toutes les catégories"
    @State private var nombreDansLePanier = 0

    // Exemple de tableau de produits avec des noms d'images depuis les assets
    let produits: [Produit] = [
        Produit(nom: "Huile de voiture", categorie: "Huile de voiture", imageName: "huile"),
        Produit(nom: "Pompe a eau", categorie: "Pièces de rechange", imageName: "pompe"),
        Produit(nom: "Accessoire", categorie: "Accessoires", imageName: "Accessoire"),
        // Ajoutez d'autres produits selon vos besoins
    ]

    var body: some View {
        VStack {
            Text("Boutique")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 40)
            //panier
            HStack {
                Spacer()
                Button(action: {
                    // TODO: Implémenter l'action du panier
                }) {
                    Image(systemName: "cart")
                    Text("Panier (\(nombreDansLePanier))")
                }
                .padding(5.0)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(15)
            //    .position(x: 317, y: 0)

                Spacer()
            }
          //  .padding(.vertical, 20)
            
            // fin panier
            Picker(selection: $categorieSelectionnee, label: Text("Catégorie")) {
                Text("Toutes les catégories").tag(-1) // Ajout de l'option "Toutes les catégories"
                ForEach(0..<produits.map { $0.categorie }.count, id: \.self) { index in
                    Text(produits[index].categorie).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            .padding(.vertical, 10)

            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 20),
                    GridItem(.flexible(), spacing: 20),
                ], spacing: 20) {
                    ForEach(produitsFiltres()) { produit in
                        BoutiqueItemView(produit: produit, ajouterAuPanier: {
                            self.nombreDansLePanier += 1
                        })
                        .padding(.bottom, 20)
                    }
                }
                .padding(.horizontal, 20)
            }

            Spacer()

     
        }
    }

    // Fonction pour filtrer les produits en fonction de la catégorie sélectionnée
    func produitsFiltres() -> [Produit] {
        if categorieSelectionnee == -1 {
            // Afficher tous les produits si "Toutes les catégories" est sélectionné
            return produits
        } else {
            // Filtrer les produits en fonction de la catégorie sélectionnée
            let categorieSelectionnee = produits[categorieSelectionnee].categorie
            return produits.filter { $0.categorie == categorieSelectionnee }
        }
    }
}

struct BoutiqueView_Previews: PreviewProvider {
    static var previews: some View {
        BoutiqueView()
    }
}
