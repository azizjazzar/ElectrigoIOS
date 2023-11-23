import SwiftUI
struct DetailViewLocation: View {
    @StateObject var vl = locationlistViewModel()
    let location : Location
    var body: some View {
        ScrollView {
    
            VStack {
                Image("borne1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 10)

                // Title and Rating section
                VStack(alignment: .center, spacing: 8) {
                    Text(location.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    HStack(spacing: 4) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 20))
                        }
                    }
                }

                // Location Type section
                Text("Restaurant")
                    .font(.headline)
                                   .padding()
                               
                                   .cornerRadius(18)
                                   .padding(.horizontal)

                // Details section
                VStack(alignment: .leading, spacing: 12) {
                    DetailRow(title: "City Name", value: location.cityname,fontSize: 16)
                    DetailRow(title: "Adresse", value: location.adresse,fontSize: 16)
                    DetailRow(title: "Type de charge", value: "\(location.typecharge)",fontSize: 16)
                    
                }
                .foregroundColor(.black)

                Text("Avis utulisateur :")
                    .font(.system(size: 20,weight:  .semibold, design:  .serif))
                    .padding(12)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    
                HStack {
                    Spacer()
                    NavigationLink(destination: AlertPage()) {
                                    Text("Go to Alert Page")
                                }

                }
                .buttonStyle(CustomButtonStyless())
                .padding(10)

                // Call to action
              
             
            .padding()

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color.white.opacity(0.95))
            .cornerRadius(20)
            .padding(.top, 30)
        }
    }
}




struct DetailRow: View {
    let title: String
    let value: String
    let fontSize: CGFloat

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: fontSize, weight: .bold))
                .foregroundColor(.secondary)

            Spacer()

            Text(value)
                .font(.system(size: fontSize, weight: .regular))
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
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

struct DetailViewLocation_Previews: PreviewProvider {
    static var vl = locationlistViewModel()
    static var previews: some View {
        DetailViewLocation(location: vl.locations.first!)
    }
}
