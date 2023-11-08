//
//  OtpValidationView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI
struct OtpValidationView: View {
    @State private var otp: [String] = Array(repeating: "", count: 4)
    @State private var isCodeSent: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                // Title
                Text("Mot de passe oublié")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.top, 20)

                // Code input field
                HStack(spacing: 20) {
                    ForEach(0..<4) { index in
                        TextField("", text: $otp[index])
                            .frame(width: 50, height: 50)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .textContentType(.oneTimeCode)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            
                            .onChange(of: otp[index]) { newText in
                                // Update the otp property
                                if newText.count == 1 {
                                    otp[index] = newText
                                } else {
                                    otp[index] = ""
                                }
                            }
                    }
                }

                .padding(.top, 20)
                .padding(.horizontal, 20)

                // Error message
                if otp.count != 4 {
                    Text("Code incorrect")
                        .foregroundColor(.red)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                }
                // "Code non envoyé ? Réessayer" button
                                Button(action: {
                                    isCodeSent = false
                                    otp = Array(repeating: "", count: 4)
                                }) {
                                    Text("Code non envoyé ? Réessayer")
                                }

                // Send button
                Button(action: { /* TODO: Implement login logic here */ }) {
                    Text("Envoyer")
                }
                .padding(.vertical, 10)
                .frame(width: 350, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                .padding(.vertical, 70)
            }
            .padding(.bottom, 20)
        }
    }
}


struct OtpValidationView_Previews: PreviewProvider {
    static var previews: some View {
        OtpValidationView()
    }
}
