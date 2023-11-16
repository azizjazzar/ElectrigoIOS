import Foundation
import CoreLocation

class UserViewModel: ObservableObject {
    var client : [User] = []

  

    
    func getAll()
    {
        // Create a URL
        if let url = URL(string: "https://api.example.com/data") {
            // Create a URLSession object
            let session = URLSession.shared
            
            // Create a URLSession data task
            let task = session.dataTask(with: url) { (data, response, error) in
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Check if there is a response
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("No response")
                    return
                }
                
                // Check if the response status code is in the success range (200-299)
                if (200...299).contains(httpResponse.statusCode) {
                    // Check if data was received
                    if let data = data {
                        // Process the received data
                        // For example, convert data to string
                        if let dataString = String(data: data, encoding: .utf8) {
                            print("Received data: \(dataString)")
                            do{
                              //  self.client  = try JSONDecoder().decode([user].self, from: data)
                            }catch{
                                print("Error: \(error)")
                            }
                        }
                    } else {
                        print("No data received")
                    }
                } else {
                    print("HTTP Error: \(httpResponse.statusCode)")
                }
            }
            
            // Start the data task
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
    
    func ajouterUser(_ user: User) {
        // Création d'une instance de User
       
        // Convertir la structure User en données JSON
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(user) else {
            fatalError("Erreur lors de l'encodage en JSON")
        }
        
        // Créer une URLRequest avec l'URL de votre API
        let url = URL(string: "http://192.168.53.92:3000/api/auth/register")! // Remplacez par votre URL
        var request = URLRequest(url: url)
        
        // Configurer la requête en tant que POST et définir le corps de la requête
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Utiliser URLSession pour envoyer la requête
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de requête : \(error.localizedDescription)")
                return
            }
            
            // Traiter la réponse de la requête
            if let httpResponse = response as? HTTPURLResponse {
                print("Code de statut HTTP : \(httpResponse.statusCode)")
                if let responseData = data {
                    // Traiter les données de réponse si nécessaire
                    let responseString = String(data: responseData, encoding: .utf8)
                    print("Réponse : \(responseString ?? "")")
                }
            }
        }
        
        // Démarrer la requête
        task.resume()
    }
}
