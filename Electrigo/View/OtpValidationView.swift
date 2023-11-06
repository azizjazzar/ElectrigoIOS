//
//  OtpValidationView.swift
//  Electrigo
//
//  Created by aziz jazzar on 5/11/2023.
//

import SwiftUI

struct OtpValidationView: View {
    @State private var otp = ""
    
    var body: some View {
        
        VStack {
            Text("Mot passe oublier")
                .font(.largeTitle)
                .bold()
                .padding(.vertical,40)
        }
        HStack(spacing: 10) {
                ForEach(0..<otp.count, id: \.self) { index in
                    TextField("", text: $otp)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
                        .keyboardType(.numberPad)
                }
            
        }
    }
}

struct OtpValidationView_Previews: PreviewProvider {
    static var previews: some View {
        OtpValidationView()
    }
}
