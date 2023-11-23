//
//  GarageFormView.swift
//  Electrigo
//
//  Created by hamza farhani on 13/11/2023.
//

import SwiftUI
struct GarageFormView: View {
    @State private var Name = ""
    @State private var Loacation = ""
    @State private var Capacity = ""
    @State private var productImage: Image?
    @State private var selectedType = ""

    var body: some View {
        NavigationView
        {
     
        VStack(alignment: .leading, spacing: 20) {
            
            NavigationLink(destination:GarageView()) {
                HStack {
                    Image(systemName: "chevron.left") // Utilise une image SF Symbols pour le bouton de retour
                           .foregroundColor(.black)
                           .padding(.leading, 8) // Ajuste la marge à gauche si nécessaire
                       Text("Retour")
                                          
                                         }
            }
                
            Text("Formulaire de Garage")
                .font(.custom("Poppins", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)

            Group {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nom")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Nom du garage", text: $Name)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Adresse du Produit")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Location ", text: $Loacation)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Size")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Capacity", text: $Capacity)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                ImagePicker(image: $productImage)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Déplacement")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    Picker("Type", selection: $selectedType) {
                        Text("Payant").tag("Payant")
                        Text("Gratuit").tag("Gratuit")
                        
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
            }
            .padding(.horizontal, 20)

            Group {
                HStack(spacing: 20) {
                    Button(action: {
                        // Logique d'annulation
                    }) {
                        Text("Annuler")
                            .font(.custom("Jost", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .padding()
                            .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                            .cornerRadius(12)
                    }
                    Button(action: {
                        // Logique de validation
                    }) {
                        Text("Valider")
                            .font(.custom("Jost", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.05, green: 0.60, blue: 1))
                            .cornerRadius(12)
                    }
                }
     
              
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .padding()
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .cornerRadius(16)
        .padding()
        }
     
    }
}



struct GarageFormView_Previews: PreviewProvider {
    static var previews: some View {
        GarageFormView()
    }
}
