//
//  LocationlistView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import SwiftUI

struct LocationlistView: View {
    @StateObject var vl = locationlistViewModel()
    @State private var selectedLocation: Location?
    var gridColumn: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @State var IsFilterApplied = false
    @State var filterByType:String = ""
    
    var body: some View {
        NavigationView {
            VStack {
               
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: gridColumn) {
                            ForEach(vl.locations) { item in
                                                        if filterByType != "" {
                                                            if item.typelocation == filterByType {
                                                                NavigationLink(destination: DetailViewLocation(location: item)) {
                                                                    LocationCardView(location: item)
                                                                        .padding(3)
                                                                }
                                                            }
                                                        } else {
                                                            NavigationLink(destination: DetailViewLocation(location: item)) {
                                                                LocationCardView(location: item)
                                                                    .padding(3)
                                                            }
                                                        }
                                                    }
                                                }
                                            }                    .overlay(
                        
                        CustomButtomFilter
                        ,alignment: .bottomTrailing)
                    .navigationTitle("Les Stations")
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: ForumBarView(isLocationForumViewPresented: $vl.isListDisplayed))
            
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
}



struct ForumBarView: View {
    @Binding var isLocationForumViewPresented: Bool
    @State private var rating: Int?

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



struct LocationlistView_Previews: PreviewProvider {
    static var previews: some View {
        LocationlistView().environmentObject(locationlistViewModel())
    }
}

extension LocationlistView{
    var CustomButtomFilter : some View {
        VStack{
            Image(systemName: "fork.knife").resizable()
                .scaledToFill()
                .frame(width: 25,height: 25,alignment: .center)
                .padding(30)
                .background((Color(uiColor: vl.getColorFromType(type: "Restaurant")).opacity(0.8)))
                .cornerRadius(50)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0)
                .onTapGesture {
                    withAnimation() {
                        filterByType = "Restaurant"
                    }
                }
            
            
            Image(systemName: "fuelpump").resizable()
                .scaledToFill()
                .frame(width: 25,height: 25,alignment: .center)
                .padding(30)
                .background((Color(uiColor: vl.getColorFromType(type: "Station")).opacity(0.8)))
                .cornerRadius(50)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0)
                .onTapGesture {
                    withAnimation() {
                        filterByType = "Station"
                    }
                    
                }
            
            
            Image(systemName: "bed.double").resizable()
                .scaledToFill()
                .frame(width: 25,height: 25,alignment: .center)
                .padding(30)
                .background((Color(uiColor: vl.getColorFromType(type: "Hotel")).opacity(0.8)))
                .cornerRadius(50)
                .padding(.trailing)
                .opacity(IsFilterApplied ? 1 : 0)
                .onTapGesture {
                    withAnimation() {
                        filterByType = "Hotel"
                    }
                    
                }
            
            
            Image(systemName: filterByType == "" ? "line.3.horizontal.decrease" : "arrow.counterclockwise").resizable()
                .scaledToFill()
                .frame(width: 25,height: 25,alignment: .center)
                .padding(30)
                .background(Color.cyan)
                .cornerRadius(50)
                .rotationEffect(Angle(degrees: IsFilterApplied ? 0 : 180 ))
                .padding(.trailing)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)){
                        filterByType = ""
                        IsFilterApplied .toggle()
                    }
                    
                }
        }
        .foregroundColor(.white)
        
    }
}
