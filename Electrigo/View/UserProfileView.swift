//
//  UserProfileView.swift
//  Electrigo
//
//  Created by aziz jazzar on 8/11/2023.
//

import SwiftUI

struct UserProfileView: View {
    @State private var name = ""
        @State private var firstName = ""
        @State private var address = ""
        @State private var phoneNumber = ""
        @State private var password = ""
    @State private var date = Date()


        var body: some View {
        
            NavigationView {
                VStack {
                    Text("Modifier Profile")
                    // Photo
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100)

                    // Form
                    Form {
                        Section {
                            TextField("Nom", text: $name)
                            TextField("Prénom", text: $firstName)
                        }
                        Section {
                            TextField("Adresse", text: $address)
                            TextField("Numéro de téléphone", text: $phoneNumber)
                        }
                        Section {
                            DatePicker(
                                "Date de naissance",
                                selection: $date,
                                displayedComponents: [.date]
                            ).frame(width: 350, height: 50)
                            
                        }
                    }

                    // Buttons
                    HStack {
                        Button(action: { /* TODO: Implement login logic here */ }) {
                            Text("Enregister")
                        }
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        Button("Annuler") {
                            // Cancel changes
                        }
                        .padding(.vertical, 10)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    }
                }
            }
        }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
