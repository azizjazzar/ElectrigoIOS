//
//  CompteBloquer.swift
//  Electrigo
//
//  Created by aziz jazzar on 8/11/2023.
//

import SwiftUI
struct CompteBloquer: View {

    @State private var isSheetPresented = false

    @State private var offset: CGFloat = 0

        var body: some View {
      Text("hello")
        }
}

struct BottomSheetView: View {
    var body: some View {
        VStack {
            Text("Cette est la sheet")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}


struct CompteBloquer_Previews: PreviewProvider {
    static var previews: some View {
        CompteBloquer()
    }
}
