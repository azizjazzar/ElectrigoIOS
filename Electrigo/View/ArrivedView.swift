//
//  ArrivedView.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import SwiftUI

struct ArrivedView: View {
    @State private var isAnimated = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 100)
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5))
                    .onAppear {
                        isAnimated = true
                    }
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5))
                    .onAppear {
                        isAnimated = true
                    }
            }.padding(50)
            Text("We Have Arrived!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Text("We have arrived at GYM location ")
                .foregroundColor(.gray)
            Spacer()
                .frame(height: 100)
            Button("OK") {
                            // TODO: Implement login logic here
                        }
                        .frame(width: 350, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)

                        .foregroundColor(.white)
                    }

            
        }
    }

struct ArrivedView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivedView()
    }
}
