//
//  PostDetailView.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//
//
//  PostDetailView.swift
//  Electrigo
//
//  Created by idriss EB on 5/11/2023.
//
import SwiftUI

struct PostDetailView: View {
    @State private var newComment: String = ""
    @State private var post: Post
    @State private var isCommentAdded = false

    init(post: Post) {
        self._post = State(initialValue: post)
    }

    var body: some View {
        VStack {
            ScrollView {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(30)
                    .padding()

                Text("ok")
                    .font(.title)
                    .foregroundColor(.blue)

                Text("ok")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text("ok")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                Text("ok")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .opacity(1)
                    .padding(.horizontal)
                    .lineLimit(nil)

                //TextField("Ajouter un commentaire", text: "ok ")
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    //.padding(.horizontal)

                Button(action: {
                    //post.comments.append(Comment(text: newComment))
                   // newComment = ""
                    //isCommentAdded = true
                }) {
                    Text("Ajouter un commentaire")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                if isCommentAdded {
                    Text("Commentaire ajouté avec succès!")
                        .foregroundColor(.green)
                        .padding()
                }

                // Liste des commentaires
                //ForEach(post.comments) { comment in
                    //CommentView(comment: comment)
                        //.padding(.horizontal)
                //}
            }
        }
        .navigationBarTitle("Detail de la publication")
        .padding(.top, 10)
    }
}
