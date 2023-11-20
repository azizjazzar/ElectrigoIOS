import Foundation
struct UserResponse: Codable {
    let user: User
}
struct User: Decodable, Encodable {
    
    var nom: String
    var prenom: String
    var email: String
    var genre: String
    var datenaissance: String
    var telephone: String
    var adresse: String
    var mot_passe: String
    var type: String
    var picture: String
    

    // Constructeur personnalisé
    init(nom: String,
         prenom: String,
         email: String,
         genre: String,
         datenaissance: String,
         telephone: String,
         adresse: String,
         mot_passe: String,
         type: String,
         picture: String)
{
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.genre = genre
        self.datenaissance = datenaissance
        self.telephone = telephone
        self.adresse = adresse
        self.mot_passe = mot_passe
        self.type = type
        self.picture = picture
       
    }

}
