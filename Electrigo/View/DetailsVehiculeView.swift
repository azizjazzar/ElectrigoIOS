//
//  DetailsVehiculeView.swift
//  Electrigo
//
//  Created by ademnsir on 7/11/2023.
//

import SwiftUI

struct DetailsVehiculeView: View {
    let vehicules: [Véhicule] = [
        Véhicule(id: 1, marque: "Ford", modele: "Ford F-150", vitesseMax: 200, capaciteBatterie: "6.3kWh", boite: "Automatique", nombreDePlaces: 5, image: "ford", imagelogo: "fordlogo", priceday: "150", userphoto: "user1", descriptionV: "Le modèle Ford F-150 est équipé de la toute dernière technologie de sécurité avancée, offrant une tranquillité d'esprit totale à ses conducteurs. Avec des fonctionnalités telles que le système de freinage automatique d'urgence, l'assistance au maintien de voie, et les airbags latéraux, la sécurité est une priorité absolue."),
        Véhicule(id: 2, marque: "Ford", modele: "A4", vitesseMax: 200, capaciteBatterie: "6.3kWh", boite: "Automatique", nombreDePlaces: 5, image: "ford", imagelogo: "fordlogo", priceday: "150", userphoto: "user1", descriptionV: "Description du modèle A4"),
        // Add more Véhicule instances here
    ]

    var body: some View {
        ScrollView {
            ForEach(vehicules, id: \.id) { vehicule in
                VStack {
                    Divider()
                        .padding(.top, 1)
                    VStack(alignment: .leading) {
                        Image(vehicule.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .padding(.bottom, 120)
                        
                        // Points de pagination
                        HStack {
                            Spacer()
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                                .font(Font.custom("Jost", size: 10))
                            Image(systemName: "circle.fill")
                                .foregroundColor(.gray)
                                .font(Font.custom("Jost", size: 10))
                            Image(systemName: "circle.fill")
                                .foregroundColor(.gray)
                                .font(Font.custom("Jost", size: 10))
                            Image(systemName: "circle.fill")
                                .foregroundColor(.gray)
                                .font(Font.custom("Jost", size: 10))
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        Text(vehicule.marque)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.bottom, 1)
                        
                        Text(vehicule.modele)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        
                        Text(vehicule.descriptionV)
                            .font(.subheadline)
                            .font(Font.custom("Jost", size: 20))
                        
                        HStack {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.green)
                                    .font(Font.custom("Jost", size: 20))
                                Text("\(vehicule.nombreDePlaces)")
                            }
                            
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.green)
                                Text(vehicule.boite)
                                    .font(Font.custom("Jost", size: 20))
                            }
                            
                            HStack {
                                Image(systemName: "car.fill")
                                    .foregroundColor(.green)
                                Text(vehicule.vitesseMax.description)
                            }
                        }
                        .padding(.top, 10)
                        
                        Button(action: {
                            // Action for reservation
                        }) {
                            Text("Réserver")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .frame(width: 297, height: 44)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                }
            }
        }
    }
}

    

struct DetailsVehiculeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsVehiculeView()
    }
}


