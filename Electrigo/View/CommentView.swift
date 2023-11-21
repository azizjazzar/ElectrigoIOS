//
//  CommentView.swift
//  Electrigo
//
//  Created by idriss on 21/11/2023.
//

import SwiftUI

struct CommentView: View {
    @State private var newReply: String = ""
    //@ObservedObject var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("")
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }

            /**ForEach(comment.replies) { reply in
                VStack(alignment: .leading, spacing: 8) {
                    Divider().padding(.leading, 8) // Ajout de la séparation
                    CommentView(comment: reply)/api/posts/posts
                        .padding(.leading, 16)
                }
            }*/

            /**Button(action: {
                // Ajoutez la réponse au commentaire
                let newReplyComment = Comment(text: newReply)
                comment.replies.ap/api/posts/postspend(newReplyComment)
                newReply = ""
            }) {
                Text("Répondre")
                    .foregroundColor(.blue)
            }
            .padding(.leading, 8)
                */
            TextField("Votre réponse", text: $newReply)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing], 8)
                .padding(.bottom, 8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}




