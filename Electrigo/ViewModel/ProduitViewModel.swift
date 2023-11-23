import Foundation

class ProduitViewModel: ObservableObject {
    @Published var produits: [Produit] = []
  
 /*
    func getAll() {
        if let url = URL(string: "http://192.168.1.7:3000/api/product/products") {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                // ... (Votre gestion des erreurs et vérifications HTTP)

                do {
                    let response = try JSONDecoder().decode(ProduitResponse.self, from: data!)
                    self.produits = response.data
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    */
    
    
    
    
    func getAll(completion: @escaping ([Produit]?) -> Void) {
        if let url = URL(string: "http://192.168.240.41:3000/api/product/products") {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    completion(nil)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    print("No response")
                    completion(nil)
                    return
                }

                if (200...299).contains(httpResponse.statusCode) {
                    if let data = data {
                        do {
                            let response = try JSONDecoder().decode(ProductListResponse.self, from: data)
                            let produits = response.products
                            completion(produits)
                        } catch {
                            print("Error decoding JSON: \(error)")
                            completion(nil)
                        }
                    } else {
                        print("No data received")
                        completion(nil)
                    }
                } else {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion(nil)
                }
            }

            task.resume()
        } else {
            print("Invalid URL")
            completion(nil)
        }
    }

    
    
    
    
    
    
    func ajouterProduit(_ produit: Produit) {
        guard let url = URL(string: "http://192.168.240.41:3000/api/product/addproduct") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(produit)
            request.httpBody = jsonData
        } catch {
            print("Error encoding produit: \(error)")
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            // ... (Votre gestion des erreurs et vérifications HTTP après l'ajout du produit)
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("No response")
                return
            }

            if (200...299).contains(httpResponse.statusCode) {
                print("Produit ajouté avec succès")
                // Vous pouvez mettre à jour votre liste de produits après l'ajout
               // self.getAll()
            } else {
                print("HTTP Error: \(httpResponse.statusCode)")
            }
        }

        task.resume()
    }

    
    
    
    
    
    
    


    // ... (Votre autre code)
}
