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
        NavigationView{
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
                NavigationLink(destination: FlotteView()) {
                    Text("OK")
                }
                .frame(width: 350, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                
                .foregroundColor(.white)
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: MapflotteView())
                    {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
        }
    }

struct ArrivedView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivedView()
    }
}
