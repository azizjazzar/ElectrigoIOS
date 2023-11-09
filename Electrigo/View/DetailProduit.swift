//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI

struct DetailProduit: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let produit: Produit
    init(produit: Produit) {
        self.produit = produit
    }

    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                Image(produit.nom)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView(produit :produit)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text(String(format: "%.2f TND", produit.prix))
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                NavigationLink(destination: RemercimentView()) {
                    
                    Text("Acheter")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(10.0)
                }

                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
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

/*struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(produit)
    }
}*/


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    let produit : Produit
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(produit.nom)
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< produit.rating) { item in
                    Image("star")
                }
                Text(" \(produit.rating)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(produit.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            
            //                Info
            HStack (alignment: .top) {
             /*  VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("langeur: 120 cm")
                        .opacity(0.6)
                    Text("largeur: 80 cm")
                        .opacity(0.6)
                  
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)*/
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Boutique")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text(produit.boutiue)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //                Colors and Counter
            HStack {
             /*   VStack (alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)*/
                
                HStack {
                    //                        Minus Button
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                        
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    //                        Plus Button
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
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
