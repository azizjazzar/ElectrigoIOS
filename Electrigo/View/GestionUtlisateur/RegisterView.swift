//
//  RegisterView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var loginController = UserViewModel()
    @State private var selectedDate = Date() // Définir la variable pour stocker la date sélectionnée
    @State private var showAlert = false
    @State private var vpass = false
    @State private var alertMessage = ""
    @State private var email = ""
    @State private var nom = ""
    @State private var prenom = ""
    @State private var passe = ""
    @State private var cpasse = ""
    @State private var adresse = ""
    @State private var date = Date()
    @State private var telephone = ""
    @State var selectedOption: Int = 1
    @State private var password = ""
    @State private var user: User? // Déclarer une variable user optionnelle pour stocker l'instance créée
    struct RadioButtonView: View {
        var index: Int
        @Binding var selectedIndex: Int

        var body: some View {
            Button(action: {
                selectedIndex = index
            }) {
                HStack {
                    Image(systemName: self.selectedIndex == self.index ? "largecircle.fill.circle" : "circle")
                        .foregroundColor(.black)
                    Text(index == 0 ? "Homme" : "Femme")
                }
            }
        }
    }
    var body: some View {
        VStack {
            Text("Rejoignez nous ")
                .font(.largeTitle)
                .bold()
            Form{
                TextField(" Email", text: $email)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                HStack
                {
                    TextField(" Nom", text: $nom)
                        .frame(width: 171, height: 50)
                        .background(Color.clear)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                    TextField(" Prenom", text: $prenom)
                        .frame(width: 171, height: 50)
                        .background(Color.clear)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                    
                }
                SecureField(" Mot passe", text: $passe)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                 
                SecureField(" Confirmer Mot passe", text: $cpasse)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                
                DatePicker(
                    "Date de naissance",
                    selection: $date,
                    displayedComponents: [.date]
                ).frame(width: 350, height: 50)
                
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                
                
                HStack
                {
                    Text("Genre")
                    
                    RadioButtonView(index: 0, selectedIndex: $selectedOption)
                    RadioButtonView(index: 1, selectedIndex: $selectedOption)
                }
                
                
                TextField(" Telephone", text: $telephone)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                
                TextField(" Adresse", text: $adresse)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
           
                Button(action: {
                    let selectedGenre = selectedOption == 0 ? "Homme" : "Femme"
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy" // Format de la date
                    
                    let dateString = dateFormatter.string(from: date)
                        
                        let newUser = User(
                            nom: nom,
                            prenom: prenom,
                            email: email,
                            genre: selectedGenre,
                            datenaissance: dateString, // Utiliser la date d'anniversaire sous forme d'objet Date
                            telephone: telephone,
                            adresse: adresse,
                            mot_passe: cpasse,
                            type: "User",
                            picture: "default"
                        )
                    if !loginController.verifieEmail(email){
                        alertMessage="Email invalide!!"
                        showAlert = true
                           }
                    else if !loginController.verifieNomPrenom(nom)
                    {
                        alertMessage="Nom doit etres alphabetique et non vide !!"
                        showAlert = true
                        
                    }
                    else if !loginController.verifieNomPrenom(prenom)
                    {
                        alertMessage="Prenom Doit etres alphabetique et non vide "
                        showAlert = true
                        
                    }
                    else if !loginController.verifieMotDePasse(passe, cpasse)
                    {
                        alertMessage="Mot passe n'est identique (comporte minimum 8 caracteres) !!"
                        showAlert = true
                        
                    }
                    else if !loginController.verifieTelephone(telephone)
                    {
                        alertMessage="telephone 8 chiffres !!"
                        showAlert = true
                        
                    }
                    else if !loginController.verifieAdresse(adresse)
                    {
                        alertMessage="Adresse non vide !!"
                        showAlert = true
                        
                    }
                   
                            else {
                                
                                loginController.getEmail(email: email) { user in
                                    if let user = user {
                                        showAlert=true
                                        alertMessage="Email deja utilisé !!"
                                    } else {
                                        loginController.ajouterUser(newUser)
                                        alertMessage="Ajout avec succes !!"
                                        showAlert = true
                                    }
                                }
                              

                           }
                    
                }) {
                    Text("Créer un compte")
                }


            .padding(.vertical, 10)
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)
            
         
            } .alert(isPresented: $showAlert) {
                Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }

        }
    }
    
    
}
struct RadioButtonView: View {
    var index: Int
    @Binding var selectedIndex: Int

    var body: some View {
        Button(action: {
            selectedIndex = index
        }) {
            HStack {
                Image(systemName: self.selectedIndex == self.index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text(index == 0 ? "Homme" : "Femme")
            }
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    
    }

}

