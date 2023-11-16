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
                TitleRowView()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubbleView(message: Message(id: "123", text: text, received: true, timestamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(Color.white)
                .cornerRadius(30)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
            .background(Color("Gray"))
            
           MessageFieldView()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct TitleRowView: View {
    let imageUrl = URL(string: "https://images.app.goo.gl/Q8KktzR2j4nE8X8C8")
    let name = "maintenance"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 50, height: 50)
                     .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack (alignment: .leading) {
               Text(name)
                .font(.title).bold()
               Text("Online")
                .font(.caption)
                .foregroundColor(.green)
        }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Image(systemName: "message")
                .foregroundColor(.gray)
                    
             
        }
    }
}
struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        TitleRowView()
    }
}

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
struct Message: Identifiable {
    let id: String
    let text: String
    let received: Bool
    let timestamp: Date
}

struct MessageBubbleView: View {
    var message: Message
    @State private var showTime = false

    var body: some View {
        VStack(alignment: message.received ? .leading: .trailing) {
            HStack {
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
            if showTime {
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
