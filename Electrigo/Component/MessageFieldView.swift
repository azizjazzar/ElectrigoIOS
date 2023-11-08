//
//  MessageFieldView.swift
//  Electrigo
//
//  Created by hamza farhani on 8/11/2023.
//

import SwiftUI

struct MessageFieldView: View {
    @State private var message = ""
    var body: some View {
        HStack{
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            Button {
                print("Message sent!")
                message = ""
                
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(Color("Gray"))
                    .padding(10)
                    .background(Color("Green"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MessageFieldView()
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: ()-> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged:
                        editingChanged, onCommit: commit)
        }
        
    }
}
