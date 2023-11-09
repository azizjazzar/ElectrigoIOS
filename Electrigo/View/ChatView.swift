//
//  ChatView.swift
//  Electrigo
//
//  Created by hamza farhani on 6/11/2023.
//

import SwiftUI

struct ChatView: View {
    var messageArray = ["Hey!", "You have a problem in the filtering system", "Check it"]
    
    var body: some View {
        VStack {
            VStack {
                //TitleRowView()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                      /*  MessageBubbleView(message: Message(id: "123", text: text, received: true, timestamp: Date())) */
                    }
                }
                .padding(.top, 10)
                .background(Color.white)
                .cornerRadius(30)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
            .background(Color("Gray"))
            
           // MessageFieldView()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
