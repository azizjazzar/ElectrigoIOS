//
//  ForgetpasswordView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI

struct ForgetpasswordView: View {
    @State private var email = ""

    var body: some View {
        NavigationView{
        VStack {
            Text(" Mot passse oublier ")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 100)
            TextField(" Email", text: $email)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
            NavigationLink(destination: ChangePasswordView()) {
                               Text("Mot passe oublier")
                    .padding(.vertical, 10)
                    .frame(width: 350, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .padding(.vertical, 30)
                           }
          
            
        
        Text("Ou ")
            .foregroundColor(.black)
            .padding(.vertical, 30)
        HStack {
            Button(action: { /* TODO: Implement action here */ }) {
                
                Image(uiImage: UIImage(named: "Google")!)
                    .resizable()
                    .frame(width: 150, height: 50)
            }
            Button(action: { /* TODO: Implement action here */ }) {
                Image(uiImage: UIImage(named: "Facebook")!)
                    .resizable()
                    .frame(width: 150, height: 50)
            }
        }.padding(.vertical, 40)
        

        HStack {
            Text("Pas encore inscris ? ")
                .foregroundColor(.black)
            NavigationLink(destination: RegisterView()) {
                               Text("Créer un compte")
                                   .underline()
                                   .foregroundColor(.black)
                           }
        }
            
        }.padding(.vertical, 60)
        

    }
    }
}

struct ForgetpasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetpasswordView()
    }
}
