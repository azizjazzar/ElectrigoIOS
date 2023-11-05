//
//  CommentsView.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//

import SwiftUI

struct CommentsView: View {
    @State private var commentText: String = ""
    @State private var comments: [String] = []
    @State private var selectedFilter: String = "Tous"
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ajouter un post")) {
                    Picker("Choisir le sujet", selection: $selectedFilter) {
                        ForEach(["Tous", "Voiture", "Bornes", "Technologie", "Autre"], id: \.self) { filter in
                            Text(filter)
                        }
                    }

                    TextField("Description", text: $commentText)
                        .frame(width: 300, height: 150)
                        .lineLimit(3)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)

                    Button("Ajouter le post") {
                        // Sauvegarde de la photo locale
                        let imageData = selectedImage?.pngData()
                        let imagePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image.png")
                        try? imageData?.write(to: imagePath)

                        // Ajout du commentaire à la liste des commentaires
                        comments.append(commentText)
                        commentText = ""
                    }
                    .padding()
                    .frame(width: 320, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
            .navigationTitle("post")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.blue)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
