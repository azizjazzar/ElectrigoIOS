//
//  ChangePasswordView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var email = ""
    @State private var passe = ""
    @State private var cpasse = ""

    var body: some View {
        VStack {
            Text("Modifier votre mot passe ")
                .font(.system(size: 30))
                .bold()
                .padding(.vertical,50)
            TextField(" Email", text: $email)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                .padding(.vertical,10)
            TextField(" Mot passe", text: $passe)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                .padding(.vertical,10)
            TextField(" Confirmer Mot passe", text: $cpasse)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                .padding(.vertical,10)
            Button(action: { /* TODO: Implement login logic here */ }) {
                Text("Valider")
            }
            .padding(.vertical, 10)
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)
            .padding(.vertical, 30)
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
