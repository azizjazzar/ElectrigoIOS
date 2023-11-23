//
//  ForgetpasswordView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI
var optNumber :String = ""

struct ForgetpasswordView: View {
    @ObservedObject public var loginController = UserViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var emailFound = false // Variable pour suivre si l'email est trouvé

    @State private var isChecked = false

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
            //++++
            if emailFound {

                NavigationLink(
                    destination: OtpValidationView(),
                    isActive: .constant(true)
                ) {
              
                    EmptyView()
                }
                .navigationBarBackButtonHidden(true)
            } else {
                Button(action: {
                    fetchUser()
                  
                    // Additional actions if needed
                }) {
                    Text("Envoyer")
                        .navigationBarBackButtonHidden(true)
                        .padding(.vertical, 10)
                        .frame(width: 350, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $isChecked) {
                    UserSetings()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }

            //++++
          
          
            
        
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
    func fetchUser() {
        
        loginController.getEmail(email: email) { retrievedUser in
            if let user = retrievedUser {
                optNumber=""
                listuser=user
                emailFound = true
                //mail
                loginController.sendEmail(email: email)
                showAlert = true
                alertMessage = "Verifier votre boite Mail !"
             
                
            } else {
                // Aucun utilisateur trouvé pour cet email
                emailFound = false
                showAlert = true
                alertMessage = "Email incorrect !"
            }
        }
        
    }

}

struct ForgetpasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetpasswordView()
    }
}
