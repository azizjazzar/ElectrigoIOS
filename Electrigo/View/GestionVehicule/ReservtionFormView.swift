//
//  ReservtionFormView.swift
//  Electrigo
//
//  Created by adem on 8/11/2023.
//

import SwiftUI

struct ReservationFormView: View {
    @Binding var isVisible: Bool
    @Binding var isReserving: Bool
    @State private var startDate = Date()
    @State private var startTime = Date()
    @State private var endDate = Date()
    @State private var endTime = Date()

    var body: some View {
        Form {
            Section(header: Text("Date de début et heure").foregroundColor(.blue)) {
                DatePicker("Date de début", selection: $startDate, displayedComponents: .date)
                DatePicker("Heure de début", selection: $startTime, displayedComponents: .hourAndMinute)
            }


            Section(header: Text("Date de fin et heure").foregroundColor(.blue)) {
                DatePicker("Date de fin", selection: $endDate, displayedComponents: .date)
                DatePicker("Heure de fin", selection: $endTime, displayedComponents: .hourAndMinute)
            }
        }
       
        Button(action: {
            // Logique de validation
        }) {
            NavigationLink(destination: ConfirmtionpaimentView()) {
                Text("Confirmer votre réservation")
                    .font(.custom("Jost", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.05, green: 0.60, blue: 1))
                    .cornerRadius(12)
            }
        }

    
      
    }
}




struct ReservationFormView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationFormView(isVisible: .constant(true), isReserving: .constant(false))
    }
}
