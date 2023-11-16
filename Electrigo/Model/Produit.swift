
import SwiftUI

struct Produit: Identifiable {
    var id = UUID()
    var nom: String
    var description: String
    var prix: Float
    var rating:Int
  /*  var couleur:String
   
    var longeur:Int
    var largeur:Int*/
    // Ajoutez d'autres propriétés selon les besoins de votre application
}

// Liste statique de produits pour le/Users/aziztemimi/Desktop/ElectrigoIOS-GestionVehicules/Model/Produit.swifts tests
let produits: [Produit] = [
    Produit(nom: "accessoire", description: "C'est un bon accessoire pour la voiture, composé de matériaux bio uniques", prix: 49 ,rating: 3),
    Produit(nom: "ours", description: "Cet élément est unique avec un design adapté à votre voiture", prix: 29,rating: 3),
    Produit(nom: "huile de voiture", description: "Huile de qualité pour l'entretien de votre moteur", prix: 79,rating: 4),
    Produit(nom: "pièce de rechange", description: "Pièce de rechange essentielle pour votre voiture", prix: 14,rating: 5)
    // Ajoutez d'autres produits au besoin
]
