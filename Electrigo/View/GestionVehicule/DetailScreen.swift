import SwiftUI

struct DetailScreen: View {
    @State private var isShawing = false

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isReservationViewPresented = false // Pour contrôler l'affichage de la page de réservation

    var body: some View {
        ZStack {
            Color("Bg")
          
            ScrollView {
                // Product Image
                ImageSliderView()


                DescriptionView()
            }
            .edgesIgnoringSafeArea(.top)


            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }), trailing: Image("threeDot"))

        // Bouton "Réserver"
        Button(action: {
            isShawing.toggle()
        }) {
            VStack {
                Image(systemName: "arrow.up.circle.fill") // Remplacez "arrow.up.circle.fill" par le nom de l'icône que vous souhaitez utiliser
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                
                Text("Glisser vers le haut pour réserver")
                    .fontWeight(.medium)
                    .opacity(0.7)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity) // Le bouton prend toute la largeur de l'écran
            .padding() // Ajoute un espacement autour du contenu du bouton
        }
        .background(Color.white)
        .cornerRadius(20) // Ajoutez cette ligne pour le coin arrondi
        .sheet(isPresented: $isShawing) {
            ReservationFormView(isVisible: .constant(true), isReserving: .constant(false))
                .body
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .offset(y: -20)



 // Ajustez la position verticale du bouton

        // NavigationLink vers la page de réservation
        NavigationLink(
            destination: ReservationFormView(isVisible: .constant(true), isReserving: .constant(false)), // Assurez-vous d'avoir créé la vue ReservationView
            isActive: $isReservationViewPresented,
            label: {
                EmptyView() // Lien de navigation invisible
            }
        )
    }
}


//image random slide
struct ImageSliderView: View {
    
    @State private var currentIndex = 0
    var slides: [String] = ["audi3 1", "audi2", "audi1", "audi4"]
    var isNewBadgeVisible: Bool = true // You can enable or disable as needed
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            ZStack(alignment: .trailing){
                
                Image(slides[currentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .shadow(color: Color.blue, radius: 5, x: 0, y: 5) // Add a blue shadow
                    .offset(x: 0, y: 50)
                    .clipped()
            }
            
            HStack(alignment: .bottom) {
                ForEach(0..<slides.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                        .offset(x: 150, y: 40) // Adjust the offset for horizontal positioning
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}





struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text("Audi \nA4")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .offset(x: 20, y: 20)
            
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
                .offset(x: 20, y: 20)
                .foregroundColor(Color.white)
            Text("L'Audi A4 est une série de voitures compactes et de taille moyenne fabriquées par le constructeur automobile allemand Audi, qui est une filiale du groupe Volkswagen")
                .lineSpacing(8.0)
                .foregroundColor(Color.white)
            
                .offset(x: 20, y: 20) // Adjust the values of x and y as needed
            
            //                Info
            HStack (alignment: .top) {
                HStack {
                    HStack {
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.blue)
                            .offset(x: 8) // Adjust the value to move the image to the left
                         
                        Text("5 places")
                            .fontWeight(.medium)
                            .padding(.vertical, 19)
                            .offset(x: -1)
                            .opacity(0.7)
                         
                    }
                    
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.blue)
                            .offset(x: -1) // Adjust the value to move the image to the left
                        
                        Text("Automatique")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .offset(x: -8)
                            .opacity(0.7)
                    }
                    
                    HStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.blue)
                            .offset(x: -8) // Adjust the value to move the image to the left
                        
                        Text("6,3kmh")
                            .fontWeight(.medium)
                            .padding(.vertical, 8)
                            .offset(x: -8)
                            .opacity(0.7)
                        
                    }
                }

               
            }
            .padding(.vertical)
            .foregroundColor(.black)

    }
      

}
        
}

struct ReserveButton: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        Button(action: {
            isVisible.toggle()
        }) {
            Text("Réserver")
                .font(.title)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
