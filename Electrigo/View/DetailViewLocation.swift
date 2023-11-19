import SwiftUI

struct DetailViewLocation: View {
    @StateObject var vl = locationlistViewModel()

    var body: some View {
        ZStack {
            Color(uiColor: vl.getColorFromType(type: "Restaurant"))
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center) {
                Image("borne1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )

                Text("Example Borne")
                    .font(.system(size: 30, weight: .bold, design: .serif))
                    .padding(.horizontal)

                Text("Restaurant")
                    .font(.system(size: 25, weight: .medium, design: .serif))
                    .padding()
                    .background(Color(uiColor: vl.getColorFromType(type: "Restaurant")))
                    .cornerRadius(20)
                    .padding(.horizontal)

                Text("This is a description of the location, including information about its services, amenities, or unique features.")
                    .font(.system(size: 16, weight: .regular, design: .serif))
                    .padding(.horizontal)

                Button("Save to Favorites") {
                    // Implement functionality to save the location to favorites
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)

                Button("Share Location") {
                    // Implement functionality to share the location with others
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            .padding(.top, 30)
        }
    }
}

struct DetailViewLocation_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewLocation()
    }
}
