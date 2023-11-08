//
//  SplashScreen.swift
//  Electrigo
//
//  Created by aziz jazzar on 8/11/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isShawing = false
    
    var body: some View {
        ZStack {
            GifImage(name: "car")
                .frame(width: 1700, height: 1900)
            
            Button(action: { isShawing.toggle() }) {
                VStack {
                    
                    Text("Glisser vers le haut,")
                        .font(.largeTitle)
                    Text("Pour explorer le monde des")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                    Text("Voiture Electriques")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Image(systemName: "arrow.up.to.line")
                        .resizable()
                        .frame(width: 30, height: 40)
                    
                }
                .sheet(isPresented: $isShawing) {
                    LoginView().body.presentationDetents([.medium,.large] )
                        .presentationDragIndicator(.visible)
                }
            }

        }.offset(y:270)
    }
}
    
       
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
    
    
}

