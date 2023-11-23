import Foundation
import CoreLocation

struct Location: Identifiable, Codable {
    let _id: String?
      let name: String
      let cityname: String
      let adresse: String
      let typelocation: String
      let typecharge: String
      let picture: String
      let coordinate: Coordinate
     

    struct Coordinate: Codable {
        let type: String
        let coordinates: [Double]
        
    }
    
    var id: String? {
        return _id
    }

    init( id: String? = nil,
          name: String,
         cityname: String,
         adresse: String,
         typelocation: String,
         typecharge: String,
         picture: String,
         coordinate: Coordinate) {
        self._id = id
        self.name = name
        self.cityname = cityname
        self.adresse = adresse
        self.typelocation = typelocation
        self.typecharge = typecharge
        self.picture = picture
        self.coordinate = coordinate
    }
}
