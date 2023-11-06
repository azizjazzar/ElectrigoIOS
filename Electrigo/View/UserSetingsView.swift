//
//  UserSetingsView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI
struct UserSetingsView: View {
    @State private var selectedTab = 0 // Initialize selectedTab to 0

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                Text("Dhia").tabItem {
                    Image(systemName: "house")
                }.tag(0)

                Text("Dhia").tabItem {
                    Image(systemName: "location.fill")
                }.tag(1)

                Text("Adem").tabItem {
                    Image(systemName: "car.fill")
                }.tag(2)

                Text("Aziz").tabItem {
                    Image(systemName: "cart.fill")
                }.tag(3)

                UserSetings().tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }.tag(4)
            }
            .accentColor(.blue)
        }
        .navigationBarTitle("Paramètres")
    }
}

struct UserSetings: View {
    @State private var selectedTab = 0
    @State private var selectedItem: String? = nil
     @State private var showingOptions = false
    @State private var isOn: Bool = false
    @State private var voitureonoff: Bool = false
    @State private var actualiteonoff: Bool = false
    var body: some View {
        
     NavigationView{
         ScrollView {
                            VStack {
                              

                                HStack {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.green)
                                        .offset(x:-15)


                                    Text("Compte")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .offset(x:-10)
                                }



                                Divider()
                                    .offset(y: 0)
                                    .padding(.bottom,30)
                                NavigationLink(destination:LoginView())
                                {
                                    
                                    Text("Modifier profile")
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .frame(width: 15, height: 10)
                                        .foregroundColor(.black)
                                        .offset(x:200)
                                        

                                    
                                }
                                
                                NavigationLink(destination:LoginView())
                                {
                                    
                                    Text("Changer mot passe")
                                            .offset(x:16)
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .frame(width: 15, height: 10)
                                        .foregroundColor(.black)
                                        .offset(x:183)
                                        

                                    
                                }
                                
                                
                                //notification
                                HStack {
                                    Image(systemName: "megaphone.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.green)

                                    
                                    Toggle("  Notifications", isOn: $isOn)
                                        .frame(width: 320)
                                        .font(.system(size: 20))
                                }.padding(.top,50)
                                    .offset(x:110)

                                Divider()
                                    .padding(.bottom,50)
                                HStack
                                {
                                    Toggle("Notification voiture", isOn: $voitureonoff)
                                        .frame(width: 360)
                                }.offset(x:108)
                                HStack
                                {
                                    Toggle("Notification actualité", isOn: $actualiteonoff)
                                        .frame(width: 360)
                                }.offset(x:108)
                                    .padding(.bottom,30)
                               
                                HStack {
                                    Image(systemName: "creditcard.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.green)
                                        .offset(x:23)


                                    Text(" Carte de fidelité")
                                        .font(.system(size: 20))
                                        .foregroundColor(.black)
                                        .offset(x:25)
                                        
                                }
                                Divider()
                            
                            
                            }
                            .offset(x:-110)
                            .padding(.bottom,30)
                             VStack
                             {
                                 Text("Point:")
                                 
                                 Text("Type:")

                                 
                             }.offset(x:-161)
                          
                    }
        
     }
                        
    }
}

    
    
struct UserSetingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSetingsView()
    }
}
    

