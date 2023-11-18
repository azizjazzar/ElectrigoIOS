//
//  LocationlistView.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import SwiftUI

struct LocationlistView: View {
    @EnvironmentObject var vm: locationlistViewModel
    @State private var selectedLocation: Location? 

    var body: some View {
        NavigationView {
            VStack {
                Text("Borne de recharge")
                    .font(.title)
                    .padding(.top, 10)

                List {
                    Section(header: Text("Locations")) {
                        ForEach(vm.locations) { location in
                            VStack(alignment: .leading, spacing: 8) {
                                Image(systemName: "location.circle")
                                    .foregroundColor(.blue)
                                Text(location.name)
                                    .font(.headline)
                                Text("City: \(location.cityname)")
                                    .font(.subheadline)
                                Text("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
                                    .font(.subheadline)
                                NavigationLink(destination: LocationDetailView(location: location)) {
                                    Text("325km")
                                        .foregroundColor(.green)
                                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.green, lineWidth: 1))
                                        .padding(.vertical, 3)
                                }
                                .padding(.trailing, 20)
                            }
                            .padding(26)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color.blue, lineWidth: 1))
                            .padding(.vertical, 5)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
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

struct LocationDetailView: View {
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
