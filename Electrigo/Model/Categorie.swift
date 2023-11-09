
import Foundation

struct Categorie: Identifiable {
    var id = UUID()
    var nom: String
    // Ajoutez d'autres propriétés selon les besoins de votre application
}
let categories: [Categorie] = [
    Categorie(nom: "tout"),
    Categorie(nom: "Accesoires"),
    Categorie(nom: "huiles"),
    Categorie(nom: "piéces de rechange"),
]
