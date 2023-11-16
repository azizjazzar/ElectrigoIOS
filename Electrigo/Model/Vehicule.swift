//
//  Vehicule.swift
//  Electrigo
//
//  Created by adem on 5/11/2023.
//


import Foundation

class Véhicule: Identifiable {
    var id: Int
    var marque: String
    var modele: String
    var vitesseMax: Int
    var capaciteBatterie: String
    var boite: String
    var nombreDePlaces: Int
    var image: String
    var imagelogo :String
    var priceday:String
    var userphoto :String
    var descriptionV :String

    init(id: Int, marque: String, modele: String, vitesseMax: Int, capaciteBatterie: String, boite: String, nombreDePlaces: Int, image: String , imagelogo: String ,priceday:String ,userphoto:String,descriptionV:String) {
        self.id = id
        self.marque = marque
        self.modele = modele
        self.vitesseMax = vitesseMax
        self.capaciteBatterie = capaciteBatterie
        self.boite = boite
        self.nombreDePlaces = nombreDePlaces
        self.image = image
        self.imagelogo = imagelogo
        self.priceday=priceday
        self.userphoto=userphoto
        self.descriptionV=descriptionV
        
    }
}

