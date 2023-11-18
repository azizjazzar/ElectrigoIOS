//
//  MainLocationListView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 18/11/2023.
//

import SwiftUI

struct MainLocationListView: View {
    var gridColumn: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var vm = reviewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridColumn) {
                    ForEach(vm.reviews) { item in
                        LocationCardView(review: item)
                            .padding(3)
                    }
                }
            }
            .navigationTitle("Les Stations")
        }
        .navigationBarItems(trailing: ForumBarViews(isLocationForumViewPresented: $vm.isListDisplayed))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Retour").foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct ForumBarViews: View {
    @Binding var isLocationForumViewPresented: Bool

    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                isLocationForumViewPresented.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isLocationForumViewPresented) {
                AddBorneView()
            }
        }
        .padding(.horizontal)
    }
}

struct MainLocationListView_Previews: PreviewProvider {
    static var previews: some View {
        MainLocationListView()
    }
}
