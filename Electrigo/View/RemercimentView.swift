import SwiftUI

struct RemercimentView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 80) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) {
                        Text("13:30")
                            .font(Font.custom("Poppins", size: 14).weight(.bold))
                            .tracking(1.61)
                            .foregroundColor(.black)
                    }
                    .frame(width: 77.50)
                    .background(.white)
                }
                .frame(maxWidth: .infinity)
                VStack(alignment: .trailing, spacing: 10) {
                    HStack(spacing: 12) {
                        ZStack {

                        }
                        .frame(width: 24, height: 24)
                        ZStack {

                        }
                        .frame(width: 24, height: 24)
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                }
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                .frame(maxWidth: .infinity)
                .background(.white)
            }
            .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
            .frame(width: 428, height: 38)
            .background(.white)
            .offset(x: 0, y: -444)
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1, height: 29)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .offset(x: -213.50, y: 211.50)
            
            VStack(spacing: 24) {
                Text("Votre commande a été effectué avec succès !")
                    .font(Font.custom("Poppins", size: 12))
                    .tracking(1.44)
                    .lineSpacing(24)
                    .foregroundColor(.black)
                
                Text("Votre commande vous sera livrée dans les délais.")
                    .font(Font.custom("Poppins", size: 12))
                    .tracking(1.44)
                    .lineSpacing(24)
                    .foregroundColor(.black)
                
                Text("Merci pour votre commande")
                    .font(Font.custom("Poppins", size: 24).weight(.bold))
                    .tracking(2.76)
                    .foregroundColor(.black)
                
           Image("remerciment")
            }
            .frame(width: 428)
            .offset(y: -60)
        }
        .frame(width: 428, height: 926)
        .background(.white)
    }
}

struct RemercimentView_Previews: PreviewProvider {
    static var previews: some View {
        RemercimentView()
    }
}
