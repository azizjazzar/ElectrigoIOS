//
//  SendView.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import SwiftUI


struct SendView: View {
    @State private var Prenom = ""
    @State private var email = ""
    @State private var commentaire = ""
    var body: some View {
        NavigationView{
            VStack{
                Image("a")
                TextField("Prenom", text: $Prenom)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)

                TextField("Email*", text: $email)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)
                
                TextField("Saisissez votre commentaire?*", text: $commentaire)
                    .frame(width: 350, height: 150)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)
                
                Button("Valider") {
                    if email.isEmpty || commentaire.isEmpty {
                            // Disable the button.
                        } else {
                            // Enable the button.
                        }
                }
                .frame(width: 201, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)

            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: FlotteView())
                    {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
            
        }
        
    }
    
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
