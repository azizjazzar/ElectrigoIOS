//
//  ConfirmtionpaimentView.swift
//  Electrigo
//
//  Created by adem on 9/11/2023.
//

import SwiftUI

struct ConfirmtionpaimentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Confirmation")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.top, 80)
            
            Spacer() // Espace ajouté sous le titre
            
            Text("Ready to confirm your payment")
                .multilineTextAlignment(.center)
                .position(x : 170  , y : 12)

            Text("Check your information")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)
                .position(x : 170  , y : 40)
            
            Image("paiment")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 700)
            

        }
        .padding()
    }
}

struct PaymentConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmtionpaimentView()
    }
}

