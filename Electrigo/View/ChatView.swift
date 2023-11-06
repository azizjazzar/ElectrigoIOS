//
//  ChatView.swift
//  Electrigo
//
//  Created by hamza farhani on 6/11/2023.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack() {
          Group {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 233, height: 43)
              .background(Color(red: 0.05, green: 0.60, blue: 1))
              .cornerRadius(35)
              .offset(x: 78.50, y: -51.50)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 84, height: 38)
                .background(Color(red: 0.05, green: 0.60, blue: 1))
                .cornerRadius(35)
                .offset(x: 0, y: 0)
              Text("Hello!")
                .font(Font.custom("Jost", size: 15).weight(.medium))
                .foregroundColor(.white)
                .offset(x: 0, y: 0)
            }
            .frame(width: 84, height: 38)
            .offset(x: 145, y: -209)
            Text("29 Nov - 02-10pm")
              .font(Font.custom("Jost", size: 10).weight(.medium))
              .foregroundColor(Color(red: 0.38, green: 0.33, blue: 0.33))
              .offset(x: 0.50, y: -235)
              .opacity(0.80)
            Text("30 Nov - 10-20Am")
              .font(Font.custom("Jost", size: 10).weight(.medium))
              .foregroundColor(Color(red: 0.38, green: 0.33, blue: 0.33))
              .offset(x: -2, y: -93)
              .opacity(0.80)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 78, height: 38)
                .background(Color(red: 0.08, green: 0.68, blue: 0.36))
                .cornerRadius(35)
                .offset(x: 0, y: 0)
              Text("Hey!")
                .font(Font.custom("Jost", size: 15).weight(.medium))
                .foregroundColor(.white)
                .offset(x: 0.50, y: 0)
            }
            .frame(width: 78, height: 38)
            .offset(x: -146, y: -261)
            ZStack() {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 289, height: 53)
                .background(Color(red: 0.08, green: 0.68, blue: 0.36))
                .cornerRadius(35)
                .offset(x: -7, y: 0)
              Text("you have a problem in filtering system\ncheck it .")
                .font(Font.custom("Jost", size: 15).weight(.medium))
                .foregroundColor(.white)
                .offset(x: 13, y: 1.50)
            }
            .frame(width: 303, height: 53)
            .offset(x: -43.50, y: -150.50)
            Text("Thank you so much for your help !")
              .font(Font.custom("Jost", size: 15).weight(.medium))
              .foregroundColor(.white)
              .offset(x: 74.50, y: -46)
            ZStack() {
              Text("Maintenance")
                .font(Font.custom("Jost", size: 15).weight(.medium))
                .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                .offset(x: 41.50, y: -7)
              Text("Actif now")
                .font(Font.custom("Jost", size: 10).weight(.medium))
                .foregroundColor(Color(red: 0.38, green: 0.33, blue: 0.33))
                .offset(x: 21, y: 11)
                .opacity(0.80)
            }
            .frame(width: 201, height: 36)
            .offset(x: -89.50, y: -359)
            ZStack() { }
            .frame(width: 35, height: 35.03)
            .offset(x: 144.50, y: -358.48)
            ZStack() {
              ZStack() {
                Text("Enter Text...")
                  .font(Font.custom("Jost", size: 12).weight(.medium))
                  .foregroundColor(Color(red: 0.38, green: 0.33, blue: 0.33))
                  .offset(x: -80, y: 0)
                  .opacity(0.80)
              }
              .frame(width: 357, height: 41)
              .offset(x: -19.50, y: 10)
            }
            .frame(width: 396, height: 41)
            .offset(x: 3, y: 350.50)
          };Group {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 430, height: 6)
              .background(Color(red: 0.05, green: 0.60, blue: 1))
              .cornerRadius(18)
              .offset(x: 1, y: -463)
              .shadow(
                color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 4
              )
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 51, height: 53)
              .background(
                AsyncImage(url: URL(string: "https://via.placeholder.com/51x53"))
              )
              .cornerRadius(89.50)
              .offset(x: -140.50, y: -359.50)
          }
        }
        .frame(width: 430, height: 932)
        .background(.white)
        .cornerRadius(16)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
