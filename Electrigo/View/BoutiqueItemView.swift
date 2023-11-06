// BoutiqueItemView.swift
import SwiftUI

struct BoutiqueItemView: View {
    let produit: Produit
    let ajouterAuPanier: () -> Void

    var body: some View {
        VStack {
            Image(produit.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 10)

            Text(produit.nom)
              
                .foregroundColor(.black)

            Button(action: {
                ajouterAuPanier()
            }) {
                Text("panier")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}

struct BoutiqueItemView_Previews: PreviewProvider {
    static var previews: some View {
        BoutiqueItemView(produit: Produit(nom: "Exemple", categorie: "Exemple", imageName: "exemple"), ajouterAuPanier: {})
    }
}
