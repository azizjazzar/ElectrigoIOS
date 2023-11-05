//
//  SendView.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import SwiftUI


struct SendView: View {
    @State private var Prenom = ""
    @State private var email = ""
    var body: some View {
        NavigationView{
            VStack{
                Image("a")
                TextField("Prenom", text: $Prenom)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)

                TextField("Email", text: $email)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)
                

            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Your back button action here
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
            
        }
        
    }
    
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
