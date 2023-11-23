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
    @State private var showAlert = false

    @ObservedObject public var loginController = UserViewModel()

    var body: some View {
        NavigationView{
            VStack {
                Text("Modifier votre mot passe ")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.vertical,50)
                TextField(" Email", text: $email)
                    .frame(width: 350, height: 50)
                    .disabled(true)

                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                    .padding(.vertical,10)
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
                Button(action: {
                    if passe == cpasse {
                        if var updatedUser = listuser {
                            updatedUser.mot_passe = passe
                            loginController.updateUser(user: updatedUser)
                            showAlert = true
                        }
                        
                        
                    }
                    
                }) {
                    Text("Valider")
                }
                .padding(.vertical, 10)
                .frame(width: 350, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                .padding(.vertical, 30)
            }
            .onAppear{
                email=listuser?.email ?? ""
            }
            .alert(isPresented: $showAlert) {
                               Alert(
                                   title: Text("Notification"),
                                   message: Text("Modification avec succes"),
                                   dismissButton: .default(Text("OK"))
                               )
                           }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
