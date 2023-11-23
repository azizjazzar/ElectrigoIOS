
import SwiftUI
struct ProductListResponse: Decodable {
    var products: [Produit]
}
struct Produit: Identifiable, Decodable, Encodable {
    var id: String  // Utilisez une chaîne pour l'identifiant
    var nom: String
    var description: String
    var prix: Float
    var rating: Int
    
    // Constructeur personnalisé sans id
    init(nom: String, description: String, prix: Float, rating: Int) {
        self.id = ""  // Initialisez avec une chaîne vide
        self.nom = nom
        self.description = description
        self.prix = prix
        self.rating = rating
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case nom, description, prix, rating
    }
    
    var uuid: UUID {
        // Utilisez une validation avant de convertir en UUID
        if let uuid = UUID(uuidString: id) {
            return uuid
        } else {
            // Générez un UUID par défaut en cas d'erreur
            return UUID()
        }
    }
}





/*
// Liste statique de produits pour le/Users/aziztemimi/Desktop/ElectrigoIOS-GestionVehicules/Model/Produit.swifts tests
let produits: [Produit] = [
    Produit(nom: "accessoire", description: "C'est un bon accessoire pour la voiture, composé de matériaux bio uniques", prix: 49 ,rating: 3),
    Produit(nom: "ours", description: "Cet élément est unique avec un design adapté à votre voiture", prix: 29,rating: 3),
    Produit(nom: "huile de voiture", description: "Huile de qualité pour l'entretien de votre moteur", prix: 79,rating: 4),
    Produit(nom: "pièce de rechange", description: "Pièce de rechange essentielle pour votre voiture", prix: 14,rating: 5)
    // Ajoutez d'autres produits au besoin
]
*/
