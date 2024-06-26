//
//  FlotteView.swift
//  Electrigo
//
//  Created by hamza farhani on 4/11/2023.
//

import SwiftUI

struct FlotteView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                Text("Gérer l'entretien de ma flotte automobile")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Image("h")
                Spacer()
                    .frame(height: 200)
                NavigationLink(destination: SendView()) {
                    
                Text("E-mailing")
                }
                .frame(width: 201, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                
                Button("SOS") {
                    // TODO: Implement login logic here
                }
                .frame(width: 200, height: 50)
                .background(Color.green)
                .cornerRadius(15)
                
                .foregroundColor(.white)
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Your back button action here
                    }) {
                        NavigationLink(destination:
                                        BarDeNavigationView(selectedTab: 1) ) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.blue)
                                        Text("Retour")
                         
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Your back button action here
                    }) {
                        NavigationLink(destination: ChatView() ) {
                            Image(systemName: "message")
                                .foregroundColor(.blue)
                            
                        }
                        
                    }
                }
                
            }
            
        }.navigationBarBackButtonHidden(true)
            
    }
    
}

struct FlotteView_Previews: PreviewProvider {
        
        static var previews: some View {
            
            FlotteView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            
        }
    
    
}
