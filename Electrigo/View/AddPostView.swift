//
//  AddPostView.swift
//  Electrigo
//
//  Created by dhia on 21/11/2023.
//

import SwiftUI

struct AddPostView: View {
    @StateObject var vf = ForumViewModel()
    @State private var description: String = ""
    @State private var date: String = ""
    @State private var showAlert = false
    @State private var category: String = ""
    @State private var publicationAddedSuccessfully = false
    @State private var navigateToContentView = false
    @State private var selectedTypecategory: Int = 0
    @State private var upvotes: Int = 0
    @State private var downvotes: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ajouter une publication")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Section(header: Text("Type:")) {
                                 Picker("Type", selection: $selectedTypecategory) {
                                     Text("voitures").tag(0)
                                     Text("bornes").tag(1)
                                     Text("autres").tag(2)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                             }
                
                
                // Use a multiline TextField for the description
                TextEditor(text: $description)
                    .frame(height: 100) // Adjust the height as needed
                    .padding()
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: {
                    showAlert = true
                    let typePostMapping = ["voitures", "bornes", "autres"]
                                               let selectedTypeString = typePostMapping[selectedTypecategory]


                    let newPost = Post(
                           _id: nil, // You may need to adjust this depending on your API or data source
                           description: description,
                           category: selectedTypeString ,
                           upvotes: upvotes,
                           downvotes: downvotes,
                           date: ""
                       
                       
                       )

                    vf.addPost(newPost)
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title)
                        Text("Ajouter")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Êtes-vous sûr de vouloir poster cette publication?"),
                        message: Text("Votre nouvelle publication sera enregistrée."),
                        primaryButton: .default(Text("Annuler")),
                        secondaryButton: .default(Text("OK")) {
                            publicationAddedSuccessfully = true
                            navigateToContentView = true
                        }
                    )
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .background(
                NavigationLink(destination: ForumView(), isActive: $navigateToContentView) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}
