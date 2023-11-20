import Foundation
import CoreLocation
import UIKit

class UserViewModel: ObservableObject {
    
    @Published var isLoading = false // Variable d'état pour le chargement
    @Published var listuser: User?
    @Published private var hostname = "192.168.236.81"
    @Published private var port = "3000"

  
    func verifieMotDePasse(_ motDePasse: String, _ confirmationMotDePasse: String) -> Bool {
        let longueurMinimum = 8
        
        if motDePasse.count < longueurMinimum {
            return false
        }
        
        if motDePasse != confirmationMotDePasse {
            return false
        }
      
        return true // Les mots de passe correspondent et respectent la longueur minimale
    }
    func verifieEmail(_ email: String) -> Bool {
        // Expression régulière pour valider l'email
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    func verifieTelephone(_ telephone: String) -> Bool {
        // Vérifier si le téléphone a une longueur de 8 chiffres et ne contient que des chiffres
        let numericCharacters = CharacterSet.decimalDigits
        let phoneWithoutFormatting = telephone.components(separatedBy: numericCharacters.inverted).joined()

        return phoneWithoutFormatting.count == 8
    }

    func verifieNomPrenom(_ texte: String) -> Bool {
        let lettreCharacterSet = CharacterSet.letters
        let espaceCharacterSet = CharacterSet(charactersIn: " ")

        // Vérifie si la chaîne n'est pas vide
        if texte.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        for caractere in texte.unicodeScalars {
            if !lettreCharacterSet.contains(caractere) && !espaceCharacterSet.contains(caractere) {
                return false
            }
        }
        
        return true
    }
    func verifieAdresse(_ texte: String) -> Bool {
        return !texte.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }


    
    func getAll()
    {
        // Create a URL
        if let url = URL(string: "http://\(hostname):\(port)/api/auth/users") {
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
                                let users = try JSONDecoder().decode([User].self, from: data)
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
    func updateUser(user: User) {
        let urlString = "http://\(hostname):\(port)/api/auth/update/\(user.email)"

        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let encoder = JSONEncoder()
            let userData = try encoder.encode(user)
            request.httpBody = userData
        } catch {
            print("Erreur lors de la conversion des données en JSON : \(error)")
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de requête : \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Code de statut HTTP : \(httpResponse.statusCode)")
                // Gérer la réponse du serveur en fonction du code de statut
                // Traiter la réponse (data) si nécessaire
            }
        }
        task.resume()
    }



      
    func getEmail(email: String, completion: @escaping (User?) -> Void) {
        self.isLoading = true // Début du chargement

        guard let encodedEmail = email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Failed to encode email")
            completion(nil)
            self.isLoading = false // Fin du chargement en cas d'erreur
            return
        }

        if let url = URL(string: "http://\(hostname):\(port)/api/auth/user/\(encodedEmail)") {
            let session = URLSession.shared

            let task = session.dataTask(with: url) { (data, response, error) in
                defer {
                    DispatchQueue.main.async {
                        self.isLoading = false // Fin du chargement après la récupération des données
                    }
                }

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

                if (200...299).contains(httpResponse.statusCode), let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                        let user = userResponse.user
                        completion(user)
                    } catch {
                        print("Error decoding JSON: \(error)")
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
            self.isLoading = false // Fin du chargement en cas d'URL invalide
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
        let url = URL(string: "http://\(hostname):\(port)/api/auth/register")! // Remplacez par votre URL
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
