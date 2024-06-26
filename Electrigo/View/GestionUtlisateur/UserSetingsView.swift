//
//  UserSetingsView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI


struct UserSetings: View {
    
    @State private var selectedTab = 0
    @State private var selectedItem: String? = nil
    @State private var showingOptions = false
    @State private var isOn: Bool = false
    @State private var voitureonoff: Bool = false
    @State private var actualiteonoff: Bool = false
    @State private var point: String = ""
    @State private var type: String = ""
    @State private var isPresentingLoginView = false
    @ObservedObject public var loginController = UserViewModel()
    @State private var showAlert = false


    var body: some View {
       
        NavigationView {
            
            
            ScrollView
            {
                ZStack{
                  
                    
                    VStack (){
                        // Profile Settings
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                                .offset(x: -15)
                            
                            Text("Compte")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .offset(x: -10)
                        }
                        
                        Divider()
                            .offset(y: 0)
                            .padding(.bottom, 30)
                        
                        NavigationLink(destination: UserProfileView()) {
                            HStack {
                                Text("Modifier profile")
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundColor(.black)
                                    .offset(x: 216)
                            }
                        }
                        
                        NavigationLink(destination: ChangePasswordView()) {
                            HStack {
                                Text("Changer mot passe")
                                    .offset(x: 16)
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundColor(.black)
                                    .offset(x: 200)
                            }
                            
                        }
                      
                            
                        
                        
                        
                        // Notifications
                        HStack {
                            Image(systemName: "megaphone.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                            
                            Toggle(" Notifications", isOn: $isOn)
                                .frame(width: 320)
                                .font(.system(size: 20))
                        }
                        .padding(.top, 50)
                        .offset(x: 110)
                        
                        Divider()
                            .padding(.bottom, 50)
                        
                        HStack {
                            Toggle("Notification voiture", isOn: $voitureonoff)
                                .frame(width: 360)
                        }
                        .offset(x: 108)
                        
                        HStack {
                            Toggle("Notification actualité", isOn: $actualiteonoff)
                                .frame(width: 360)
                        }
                        .offset(x: 108)
                        .padding(.bottom, 30)
                        
                        // Carte de fidelité
                        HStack {
                            Image(systemName: "creditcard.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                                .offset(x: 23)
                            
                            Text("Carte de fidelité")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .offset(x: 25)
                            
                        }
                        .offset(x: -8)
                        .padding(.bottom, 30)
                        
                        
                        // Point and Type Input
                        
                        HStack {
                            HStack {
                                Text("Point:")
                                TextField("", text: $point)
                                    .disabled(true)
                                    .frame(width: 110, height: 30)
                                    .background(Color.clear)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }.position(x:200,y:0)
                            
                            HStack {
                                
                                Text("Type:")
                                TextField("", text: $type)
                                    .disabled(true)
                                    .frame(width: 110, height: 30)
                                    .background(Color.clear)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }.position(x:200,y:0)
                            
                        }
                        .offset(x: 0)
                        .padding(.bottom, 30)
                        
                        
                        
                    }
                    .offset(x: -110)
                    .padding(.bottom, 30)
                }.padding(.top, 70)
                
                Button(action: {
                                   // Set the flag to true to present the LoginView
                    isPresentingLoginView = true

                               }) {
                                   Text("Déconnexion")
                                       .padding()
                                       .frame(width: 320, height: 40)
                                       .background(Color.red)
                                       .cornerRadius(15)
                                       .foregroundColor(.white)
                               }
                               .navigationBarBackButtonHidden(true)
                               .fullScreenCover(isPresented: $isPresentingLoginView) {
                                           // Use fullScreenCover to present the LoginView
                                           LoginView()
                                       }
                           
                
                .padding(.vertical, 10)
                .frame(width: 320, height: 40)
                .opacity(0.7)
                .cornerRadius(15)
                Button(action: {
                               showAlert = true
                           }) {
                               Text("Supprimer mon compte")
                                   .padding()
                                   .frame(width: 320, height: 40)
                                   .background(Color.red)
                                   .cornerRadius(15)
                                   .foregroundColor(.white)
                           }
                           .navigationBarBackButtonHidden(true)
                           .fullScreenCover(isPresented: $isPresentingLoginView) {
                               // Use fullScreenCover to present the LoginView
                               LoginView()
                           }
                           .alert(isPresented: $showAlert) {
                               Alert(
                                   title: Text("Confirmation"),
                                   message: Text("Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible."),
                                   primaryButton: .default(Text("Annuler")),
                                   secondaryButton: .destructive(Text("Supprimer"), action: {
                                       loginController.deleteUser(email: listuser?.email ?? "" ){
                                           success, error in
                                              if success {
                                                  print("User deleted successfully.")
                                                  isPresentingLoginView = true

                                              } else {
                                                  print("Error deleting user:", error ?? "Unknown error")
                                              }
                                       }
                                   })
                               )
                           }
                           .fullScreenCover(isPresented: $isPresentingLoginView) {
                               // Use fullScreenCover to present the LoginView
                               LoginView()
                           }
                           
                
                .padding(.vertical, 10)
                .frame(width: 320, height: 40)
                .opacity(0.7)
                .cornerRadius(15)
            }
        }.navigationBarBackButtonHidden(true)
    }
}






    
    
struct UserSetingsView_Previews: PreviewProvider {
    @Binding var isLoggedOut: Bool

    static var previews: some View {
        UserSetings()
    }
}
    

