//
//  PaimentflotteView.swift
//  Electrigo
//
//  Created by hamza farhani on 8/11/2023.
//

import SwiftUI

struct PaimentflotteView: View {
  var body: some View {
    ZStack() {
      Group {
        Text("Confirmation")
          .font(Font.custom("Jost", size: 20).weight(.heavy))
          .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
          .offset(x: 1, y: -354.50)
        Text("         Ready to confirm\n your payment and start your\n                with us ?")
          .font(Font.custom("Jost", size: 23).weight(.heavy))
          .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
          .offset(x: -1, y: -230.50)
          
        Text("   Check your information confirm your order and enjoy  ")
          .font(Font.custom("Jost", size: 20).weight(.semibold))
          .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
          .offset(x: -0.50, y: -147)
          .opacity(0.50)
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 355, height: 97)
            .background(Color(red: 0.05, green: 0.60, blue: 1))
            .cornerRadius(18)
            .offset(x: 0, y: -73)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 355, height: 365)
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
            .cornerRadius(18)
            .offset(x: 0, y: 36)
        }
        .frame(width: 355, height: 437)
        .offset(x: 0.50, y: 122.50)
        Text("/Day")
          .font(Font.custom("Jost", size: 14).weight(.heavy))
          .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
          .offset(x: 27.50, y: 127)
          .opacity(0.50)
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 306, height: 50)
            .background(Color(red: 0.05, green: 0.60, blue: 1))
            .cornerRadius(12)
            .offset(x: 0, y: -50)
          Text("Confirm Payment\n")
            .font(Font.custom("Jost", size: 16).weight(.bold))
            .foregroundColor(.white)
            .offset(x: 1, y: -40)
        }
        .frame(width: 306, height: 50)
        .offset(x: 0, y: 409)
        Text("Audi A1 ")
          .font(Font.custom("Jost", size: 19).weight(.black))
          .foregroundColor(.black)
          .offset(x: 0.50, y: 50.50)
          .opacity(0.70)
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 55, height: 25)
            .background(Color(red: 0.16, green: 0.16, blue: 0.16))
            .cornerRadius(12.50)
            .offset(x: 0, y: 0)
          Text("4.1")
            .font(Font.custom("Jost", size: 12).weight(.black))
            .foregroundColor(.white)
            .offset(x: 0.50, y: -2)
        }
        .frame(width: 55, height: 25)
        .offset(x: 119.50, y: -56.50)
        ZStack() { }
        .frame(width: 18, height: 21.48)
        .offset(x: -79, y: 87.74)
      };Group {
        Text("Ariana , El ghazela ")
          .font(Font.custom("Jost", size: 15).weight(.medium))
          .foregroundColor(.black)
          .offset(x: 13, y: 88)
          .opacity(0.70)
        Text("Jhon Smith")
          .font(Font.custom("Jost", size: 15).weight(.semibold))
          .foregroundColor(.white)
          .offset(x: -109.46, y: -55)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 296, height: 52)
          .cornerRadius(12)
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .inset(by: 0.50)
              .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 0.50)
          )
          .offset(x: -1, y: 175)
        ZStack() {
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 46, height: 31.80)
            .background(Color(red: 0.16, green: 0.16, blue: 0.16))
            .cornerRadius(9)
            .offset(x: 0, y: 0)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 30.10, height: 30.10)
            .background(
              AsyncImage(url: URL(string: "https://via.placeholder.com/30x30"))
            )
            .offset(x: -0, y: -0.28)
        }
        .frame(width: 46, height: 31.80)
        .offset(x: -111, y: 174.90)
        Text("150$")
          .font(Font.custom("Jost", size: 14).weight(.heavy))
          .foregroundColor(Color(red: 0.08, green: 0.68, blue: 0.36))
          .offset(x: -9, y: 127)
        Text("** ** ** 2536 ")
          .font(Font.custom("Jost", size: 15).weight(.medium))
          .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
          .offset(x: 13, y: 175)
        Text("28 NOV 2023")
          .font(Font.custom("Jost", size: 20).weight(.semibold))
          .foregroundColor(Color(red: 0.03, green: 0, blue: 0))
          .offset(x: 0.50, y: 287)
          .opacity(0.50)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 430, height: 6)
          .background(Color(red: 0.05, green: 0.60, blue: 1))
          .cornerRadius(18)
          .offset(x: 1, y: -463)
          .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 4
          )
      }
    }
    .frame(width: 430, height: 932)
    .background(.white)
    .cornerRadius(16);
  }
}

struct PaimentflotteView_Previews: PreviewProvider {
  static var previews: some View {
   PaimentflotteView()
  }
}
