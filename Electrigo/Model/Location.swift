import Foundation
import CoreLocation
struct LocationListResponse : Decodable
{
    var locations: [Location]
}
struct Location: Identifiable, Decodable, Encodable {
    var id: String
    var name: String
    var cityname: String
    var adresse: String
    var typelocation: String
    var typecharge: String
    var picture: String
    var coordinate: Coordinate

    struct Coordinate: Identifiable, Codable {
            var id: UUID { UUID() }
            var latitude: Double
            var longitude: Double
            var coordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
        }
    enum CodingKeys: String, CodingKey {
           case id = "_id"
        case name, cityname, adresse, typelocation,typecharge,picture,coordinate
       }
    var uuid: UUID {
            // Utilisez une validation avant de convertir en UUID
            if let uuid = UUID(uuidString: id) {
                return uuid
            } else {
                // Générez un UUID par défaut en cas d'erreur
                return UUID()
            }
        }
    init(name: String,
         cityName: String,
         address: String,
         typeLocation: String,
         typeCharge: String,
         picture: String,
         coordinate: Coordinate) {
        self.id = ""
        self.name = name
        self.cityname = cityName
        self.adresse = address
        self.typelocation = typeLocation
        self.typecharge = typeCharge
        self.picture = picture
        self.coordinate = coordinate
    }
}
