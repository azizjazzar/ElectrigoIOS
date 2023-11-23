//
//  GarageView.swift
//  Electrigo
//
//  Created by hamza farhani on 12/11/2023.
//

//
//  GarageView.swift
//  Electrigo
//
//  Created by hamza farhani on 10/11/2023.
//

import SwiftUI

    
    struct GarageView: View {
        @State private var search: String = ""
        @State private var selectedLogo: String?

        let garages: [Garage] = [
            Garage(id: 1, name: "City Garage", location: "Downtown", capacity: 50, phone: "123-456-7890", descritionG: "A large city garage.", pic: "d" ),
            Garage(id: 2, name: "Suburban Garage", location: "Suburbia", capacity: 30, phone: "987-654-3210", descritionG: "A garage in the suburbs.", pic: "borne1" ),
            Garage(id: 3, name: "Local Repair Shop", location: "City Center", capacity: 20, phone: "555-123-4567", descritionG: "A small repair shop.", pic: "borne1" ),
            Garage(id: 4, name: "Highway Service Station", location: "On the highway", capacity: 40, phone: "111-222-3333", descritionG: "Service station along the highway.", pic: "borne2"),
            Garage(id: 5, name: "Rural Auto Workshop", location: "Countryside", capacity: 25, phone: "777-888-9999", descritionG: "An auto workshop in the rural area.", pic: "borne1")
        ]

        struct LogoListView: View {
            let logos: [String] = ["logo1", "logo2", "logo3"] // Add your logos

            @Binding var selectedLogo: String?

            var body: some View {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        Button(action: {
                            selectedLogo = nil // Show all garages
                        }) {
                            Text("Tous")
                                .font(.callout)
                                .fontWeight(selectedLogo == nil ? .bold : .regular)
                                .foregroundColor(selectedLogo == nil ? .blue : .black)
                        }

                        ForEach(logos, id: \.self) { logo in
                            Button(action: {
                                selectedLogo = logo // Select the logo
                            }) {
                                Image(logo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(8)
                                    .background(selectedLogo == logo ? Color.blue : Color.white)
                                    .cornerRadius(10)
                            }
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                }.navigationBarItems(trailing:
                                     BarView()
                                    )
                .navigationBarItems(trailing:
                                     SOSView()
                    
                                    )
        
            }
        }

        var body: some View {
            NavigationView {
                ZStack {
                    Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                        .ignoresSafeArea()
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            //AppBarView()

                            TagLineView()

                            SearchAndScanView(search: $search)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                .padding(10)
                                
                            LogoListView(selectedLogo: $selectedLogo)

                            Text("Populaire")
                                .font(.title)
                                .bold()
                                .padding(.horizontal)
                                .foregroundColor(.black)
                    
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(garages, id: \.id) { garage in
                                        if selectedLogo == nil || selectedLogo == garage.name.lowercased() {
                                            NavigationLink(destination: GarageDetailScreen(garage: garage)) {
                                                GarageCardView(garage: garage)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }

                            Text("Nos nouveaux garages")
                                .font(.title)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(garages, id: \.id) { garage in
                                        NavigationLink(destination: GarageDetailScreen(garage: garage)) {
                                            GarageCardView(garage: garage)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
    }
    
struct GarageDetailScreen: View {
    let garage: Garage
    let maxRating: Int = 5 // Maximum rating value
    @State private var rating : Int?
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(garage.pic)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(garage.name)
                                .font(.title)
                                .bold()
            
                            
                            NavigationLink(destination: ChatView() ) {
                                Image(systemName: "message")
                                    .foregroundColor(.blue)
                                
                         
                    }
                }

                        Text("Location: \(garage.location)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Capacity: \(garage.capacity) vehicles")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack {
                            Text("Phone: \(garage.phone)")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Button(action: {
                                if let phoneURL = URL(string: "tel://\(garage.phone)"), UIApplication.shared.canOpenURL(phoneURL) {
                                    UIApplication.shared.open(phoneURL)
                                }
                            }) {
                                Image(systemName: "phone.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }

                        HStack {
                            Text("Rating:")
                                .font(.headline)
                                .bold()

                            // Display star rating for the garage
                           RatingflotteView(rating: $rating)

                            // Add a "Vote" button
                            Button(action: {
                                // Implement the action for the "Vote" button
                                // This can include logic for submitting a vote
                            }) {
                                Text("Vote")
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                            }
                        }

                        Text("Description:")
                            .font(.headline)
                            .bold()

                        Text(garage.descritionG)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)

                }
                .padding()
            }
            .navigationBarTitle(garage.name, displayMode: .inline)
        }
                
    }
}





    struct GarageCardView: View {
        let garage: Garage

        var body: some View {
            VStack {
                Image(garage.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 100)
                    .cornerRadius(10)

                Text(garage.name)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top, 4)
                

                HStack {
                    Spacer()
                    Text("Capacity: \(garage.capacity)")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                }
            }
            .frame(width: 150, height: 180)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            
        }
    }
struct BarView: View {
    @State private var isGarageForumViewPresented = false // Ajoutez un état pour contrôler la présentation de la page VehiculeForumView

    var body: some View {
        HStack {
            

            Spacer()

            Button(action: {
                isGarageForumViewPresented.toggle() // Activez la présentation de la page VehiculeForumView
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title) // Utilisez une icône "+" de système
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isGarageForumViewPresented) {
                GarageFormView()
                // Utilisez NavigationLink pour présenter la page GarageForumView
            }
        }
        .padding(.horizontal)
    }
}
struct SOSView: View {
    @State private var isGarageForumViewPresented = false // Ajoutez un état pour contrôler la présentation de la page GarageForumView

    var body: some View {
        HStack {
            

            Spacer()

            Button(action: {
                isGarageForumViewPresented.toggle() // Activez la présentation de la page GarageForumView
            }) {
                Image(systemName: "sos.circle.fill")
                    .font(.title)
                    .foregroundColor(.red)
                
            }
            .sheet(isPresented: $isGarageForumViewPresented) {
                FlotteView() // Utilisez NavigationLink pour présenter la page GarageForumView
            }
        }
        .padding(.horizontal)
    }
}




struct GarageView_Previews: PreviewProvider {
    static var previews: some View {
        GarageView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}




