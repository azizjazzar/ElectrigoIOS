//
//  MessageBubbleView.swift
//  Electrigo
//
//  Created by hamza farhani on 8/11/2023.
//

import SwiftUI

struct MessageBubbleView: View {
    var message: Message
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading: .trailing){
            HStack{
                Text(message.text)
                    .colorInvert()
                    .padding()
                    .background(message.received ? Color("Green") : Color("Blue"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading: .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading: .trailing, 25)
            
            }
                
            }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading: .trailing)
        .padding(message.received ? .leading: .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleView(message: Message(id: "123", text: "Hey!", received: true, timestamp: Date()))
        
    }
}
