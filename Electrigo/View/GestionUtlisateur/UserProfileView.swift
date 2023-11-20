//
//  UserProfileView.swift
//  Electrigo
//
//  Created by aziz jazzar on 8/11/2023.
//

import SwiftUI

struct UserProfileView: View {

    @ObservedObject public var loginController = UserViewModel()
    @State private var emailFound = false // Variable pour suivre si l'email est trouvé

    @State private var name = ""
        @State private var firstName = ""
        @State private var address = ""
        @State private var phoneNumber = ""
        @State private var password = ""
    @State private var date = Date()


    var body: some View {
        
        NavigationView {
            VStack {
                Text("Modifier Profile")
                // Photo
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                // Form
                Form {
                    
                    Section {
                        TextField("Nom", text: $name)
                        
                        
                        TextField("Prénom", text: $firstName)
                    }
                    Section {
                        TextField("Adresse", text: $address)
                        TextField("Numéro de téléphone", text: $phoneNumber)
                    }
                    Section {
                        DatePicker(
                            "Date de naissance",
                            selection: $date,
                            displayedComponents: [.date]
                        ).frame(width: 350, height: 50)
                        
                    }
                }
                
                // Buttons
                HStack {
                    Button(action: {
                        if var updatedUser = listuser {
                            updatedUser.nom = name
                            updatedUser.prenom = firstName
                            updatedUser.adresse = address
                            updatedUser.telephone = phoneNumber

                    

                            loginController.updateUser(user: updatedUser)
                        }


                        
                    }) {
                        Text("Enregister")
                    }
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    
                    Button("Annuler") {
                        // Cancel changes
                    }
                    .padding(.vertical, 10)
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                }
            }
        } .onAppear {
            if let user = listuser {
                name = user.nom
                firstName = user.prenom
                address = user.adresse
                phoneNumber = user.telephone
                
                let dateString = user.datenaissance // Supposons que user.datenaissance soit une chaîne valide
                
                // Création d'un DateFormatter
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy" // Format de la chaîne de date
                
                // Conversion de la chaîne en objet Date
                if let dateOfBirth = dateFormatter.date(from: dateString) {
                    date = dateOfBirth
                } else {
                    // Gérer le cas où la conversion échoue
                    print("Erreur lors de la conversion de la date")
                }
            } else {
                // Gérer le cas où listuser est nul
                print("Aucun utilisateur trouvé")
            }
        }
    }
  

}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
   
}
