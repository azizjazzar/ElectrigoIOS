//
//  SendView.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import SwiftUI


struct SendView: View {
    @State private var Prenom = ""
    @State private var phoneNumber: String = ""
    @State private var commentaire = ""
    var body: some View {
        NavigationView{
            VStack{
                Image("h")
                TextField("Prenom", text: $Prenom)
                    .padding(12)
                    .frame(width: 350, height: 50)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)

                NavigationLink(destination: CountryCodesView()) {
                
                                }

                CountryCodesView()
                                   .padding(.vertical, 10)

                              
                            
                
                TextField("Saisissez votre commentaire?*", text: $commentaire)
                    .padding(12)
                    .frame(width: 350, height: 150)
                    .background(Color.clear)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 10)
                NavigationLink(destination: MapflotteView()) {
                    Text("Valider") 
                }
                .frame(width: 201, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)

            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: BarDeNavigationView(selectedTab: 1))
                    {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("").foregroundColor(.blue)
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
