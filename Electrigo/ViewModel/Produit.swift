// Produit.swift
import Foundation

struct Produit: Identifiable {
    var id: UUID = UUID()
    var nom: String
    var categorie: String
    var imageName: String
}
