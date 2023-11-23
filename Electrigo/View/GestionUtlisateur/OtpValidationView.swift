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
    @State private var showAlert = false
    @State private var hasRetried = false
    @ObservedObject public var loginController = UserViewModel()

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
                
                Button(action: {
                    // Additional actions for retrying if needed
                    isCodeSent = false // Reset isCodeSent when retrying
                    showAlert = false
                    loginController.sendEmail(email: listuser?.email ??  "" )
                }) {
                    Text("Code non envoyé ? Réessayer")
                }
                // Retry button
                Button(action: {
                    if isOtpValid() {
                        isCodeSent = true
                    } else {
                        showAlert = true
                        hasRetried = true
                    }
                }) {
                    Text("Changer le mot de passe")
                        .padding(.vertical, 10)
                        .frame(width: 350, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                }
                .padding(.bottom, 20)

                // "Code non envoyé ? Réessayer" button
                
            }
            .padding(.bottom, 20)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erreur"), message: Text("Code incorrect"), dismissButton: .default(Text("OK")))
            }
            .background(
                NavigationLink(destination: ChangePasswordView(), isActive: $isCodeSent) {
                    EmptyView()
                }
                .navigationBarBackButtonHidden(true)
            )
        }
    }

    // Function to check if OTP is valid
    private func isOtpValid() -> Bool {
        let enteredOtp = otp.joined()
        return enteredOtp == optNumber
    }
}




struct OtpValidationView_Previews: PreviewProvider {
    static var previews: some View {
        OtpValidationView()
    }
}
