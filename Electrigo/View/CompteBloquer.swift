//
//  CompteBloquer.swift
//  Electrigo
//
//  Created by aziz jazzar on 8/11/2023.
//

import SwiftUI
struct CompteBloquer: View {

    @State var message: String = ""

    var body: some View {
        // Crée un fond gris
        VStack{
            // Crée une icône du système pour représenter l'utilisateur bloqué
            Image(systemName: "person.badge.minus")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.black)
            // Crée un champ de texte pour permettre à l'utilisateur d'envoyer un message
            Text("Votre compte a été blocquer temporairement suspendu pour avoir enfreint nos régles.Contacter nous si vous pensez que c'est une erreur.")


            TextField("Votre message", text: $message)
                .frame(width: 300, height: 300)
            
            // Crée un bouton pour envoyer le message
            Button("Envoyer") {
                // Envoie le message à un serveur ou à une base de données
            }
        }
    }
}


struct CompteBloquer_Previews: PreviewProvider {
    static var previews: some View {
        CompteBloquer()
    }
}
