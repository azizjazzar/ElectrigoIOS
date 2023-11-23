//
//  CartManager.swift
//  SweaterShopApp
//
//  Created by aziz temimi
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Produit] = []
    @Published private(set) var total: Float = 0
    
    // Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    
    // Functions to add and remove from cart
    func addToCart(product: Produit) {
        products.append(product)
        total += product.prix
    }
    
    func removeFromCart(product: Produit) {
        products = products.filter { $0.id != product.id }
        total -= product.prix
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
}
