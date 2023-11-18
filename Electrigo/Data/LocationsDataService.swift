import Foundation
import CoreLocation

class LocationsDataService {
    static let locations: [Location] = [
        Location(
            id:"12345454646",
            name: "Total Borne",
            cityname: "Nabeul City",
            adresse: "Example Address",
            typelocation: "hotel",
            typecharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 37.7749,
                longitude: -122.4194
            )
        ),
        Location(
            id:"12345454646",
            name: "Shell Borne",
            cityname: "Nabeul City",
            adresse: "Example Address",
            typelocation: "hotel",
            typecharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 33.892166,
                longitude: -9.561555499999997
            )
        ),
        Location(
            id:"12345454646",
            name: "Movanpick Borne",
            cityname: "Nabeul City",
            adresse: "Example Address",
            typelocation: "hotel",
            typecharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 37.268674,
                longitude: -9.770296
            )
        ),
        // Add more locations as needed
    ]
}

       
