//
//  RegisterView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var nom = ""
    @State private var prenom = ""
    @State private var passe = ""
    @State private var cpasse = ""
    @State private var date = Date()
    @State private var telephone = ""
    
    @State private var password = ""
    var body: some View {
        VStack {
            Text("Rejoignez nous ")
                .font(.largeTitle)
                .bold()
            
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
            TextField(" Mot passe", text: $passe)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
            TextField(" Confirmer Mot passe", text: $cpasse)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                       DatePicker(
                              " Start Date",
                              selection: $date,
                              displayedComponents: [.date]
                          ).frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1))
            Text("Genre")
            TextField(" Telephone", text: $cpasse)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))

            Button(action: { /* TODO: Implement login logic here */ }) {
                Text("Créer un compte")
            }
            .padding(.vertical, 10)
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)
            
         
              

        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    
    }

}
