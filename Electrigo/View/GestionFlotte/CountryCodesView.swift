//
//  CountryCodesView.swift
//  Electrigo
//
//  Created by hamza farhani on 12/11/2023.
//

import SwiftUI

struct CountryCodesView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+1" // Default country code

    let countryCodes = [
        ("+1", "🇺🇸"), // United States
        ("+44", "🇬🇧"), // United Kingdom
        ("+49", "🇩🇪"), // Germany
        ("+81", "🇯🇵"), // Japan
        ("+86", "🇨🇳"), // China
        ("+91", "🇮🇳"), // India
        ("+234", "🇳🇬"),// Nigeria
        ("+216", "🇹🇳") // Tunisia
    ] // Add more country codes and flags as needed

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                // Picker with transparent background
                Picker("", selection: $selectedCountryCode) {
                    ForEach(countryCodes, id: \.0) { (code, flag) in
                        Text("\(flag) \(code)")
                            .tag(code)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80) // Set the width of the picker
                .padding(.horizontal, 16)
                .background(Color.clear) // Set background color to clear
            }
            
            // TextField
            TextField("Phone Number*", text: $phoneNumber)
                .padding(90)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 1)
                )
                .keyboardType(.numberPad) // Set keyboard type to numeric
                .textContentType(.telephoneNumber) // Set text content type to telephone number
        }
        .padding()
    }


}

struct CountryCodesView_Previews: PreviewProvider {
    static var previews: some View {
        CountryCodesView()
    }
}



