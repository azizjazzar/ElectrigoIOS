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
                                    if item.typelocation == filterByType{
                                        LocationCardView(location: item)
                                            .padding(3)
                                    }
                                    
                                } else {
                                    LocationCardView(location: item)
                                        .padding(3)
                                }
                                
                            }
                        }
                    }
                    .overlay(
                        
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

/**struct LocationDetailView: View {
    var location: Location // Replace YourLocationType with your location type
    @State private var showContributeButtons: Bool = false
    @State private var isRatingForumViewPresented = false
 
//
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Image Gallery
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        Image(location.picture)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 150)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 10)
                    
                }

                // Title
                Text(location.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                // Stars
                HStack {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.bottom, 16)

                // Details Section
                Text("Détails:")
                    .font(.headline)
                    .foregroundColor(.accentColor)

                VStack(alignment: .leading, spacing: 4) {
                    DetailRow(title: "Adresse", value: location.name)
                    DetailRow(title: "Type de borne", value: location.name)
                    DetailRow(title: "Nombre de prises", value: "\(location.name)")
                }
                .foregroundColor(.black)
                .padding(.bottom, 16)
                
                Text("Avis des utilisateurs :")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .padding(.top, 16)

                //ForEach(location.reviews, id: \.self) { review in
                    VStack(alignment: .leading, spacing: 1) {
                        //HStack {
                            //ForEach(1...5, id: \.self) { index in
                                //Image(systemName: index <= review.rating ? "star.fill" : "star")
                                    //.resizable()
                                    //.aspectRatio(contentMode: .fit)
                                   // .frame(width: 25, height: 25)
                                    //.foregroundColor(Color("StarColor"))
                            //}
                        //}
                        
                        Text("Commentaire:")
                            .font(.headline)
                            .foregroundColor(Color.green)
                            .padding(.bottom, 4)

                        //Text(review.comment)
                    //.font(.body)
                            //.foregroundColor(.primary)
                            //.lineLimit(nil)
                            //.fixedSize(horizontal: false, //vertical: true)
                            //.padding(.bottom, 8)
                             
                         //}
                    //.padding(3)
                    //.background(Color("ReviewBackgroundColor"))
                    //.cornerRadius(10)
                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("BorderColor"), lineWidth: 1))
                }


                // Add and Report Buttons in the Top
                HStack {
                    Spacer()
                    

                    NavigationLink(destination: AlertPage()) {
                                    Text("Go to Alert Page")
                                }

                    
                }
                .buttonStyle(CustomButtonStyless())
                .padding(10)

                // Call to action
              
                    .padding(.top, 20)
            }
            .padding()
        }
        .navigationBarTitle("Détail de la borne", displayMode: .inline)
        .navigationBarItems(trailing: ReviewBarView(isRatingForumViewPresented: $isRatingForumViewPresented))
        .background(Color(.systemBackground)) // Set a light background color
    }
}



struct DetailRow: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body)
                .foregroundColor(.secondary)

            Text(value)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(.bottom, 8)
    }
}



struct ContributeButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Signaler un problème")
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(Color.red.opacity(0.75))
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 4)
        }
        .padding(.horizontal, 39)
    }
}


struct ReviewBarView: View {
    @Binding var isRatingForumViewPresented: Bool
    @State private var rating: Int?

    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                isRatingForumViewPresented.toggle()
            }) {
                Image(systemName: "pencil.circle")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isRatingForumViewPresented) {
                LocationReviewForm(rating: $rating)
            }
        }
        .padding(.horizontal)
    }
}*/

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
