import Foundation
import CoreLocation

class LocationsDataService {
    static let locations: [Location] = [
        Location(
            name: "Total Borne",
            cityName: "Nabeul City",
            address: "Example Address",
            typeLocation: "hotel",
            typeCharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 37.7749,
                longitude: -122.4194
            )
        ),
        Location(
            name: "Shell Borne",
            cityName: "Nabeul City",
            address: "Example Address",
            typeLocation: "hotel",
            typeCharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 33.892166,
                longitude: -9.561555499999997
            )
        ),
        Location(
            name: "Movanpick Borne",
            cityName: "Nabeul City",
            address: "Example Address",
            typeLocation: "hotel",
            typeCharge: "gratuit",
            picture: "borne1",
            coordinate: Location.Coordinate(
                latitude: 37.268674,
                longitude: -9.770296
            )
        ),
        // Add more locations as needed
    ]
}

       
