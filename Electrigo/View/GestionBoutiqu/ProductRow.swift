//
//  ProductRow.swift
//  SweaterShopApp
//
//  Created by Stephanie Diep on 2022-01-03.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Produit
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.nom)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.nom)
                    .bold()

                Text("$\(product.prix)")
            }
            
            Spacer()

            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/*struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
       ProductRow(product: productList[2])
            .environmentObject(CartManager())
    }
}*/