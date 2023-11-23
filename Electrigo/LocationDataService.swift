//
//  LocationDataService.swift
//  Electrigo
//
//  Created by hamza farhani on 5/11/2023.
//

import Foundation
import MapKit

class LocationsDataService {
    static let locations: [Location] = [
        Location(
            name: "Total",
            cityName: "marsa",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "borne1",
                "borne1",
                "borne3",
            ]
        ),
        Location(
            name: "Movenpick",
            cityName: "Lac",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "borne1",
                "borne1",
                "borne1",
            ]
        ),
        Location(
            name: "Terminal Audi",
            cityName: "La goulette",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "borne1",
                "borne2",
                "borne3",
            ]
        ),
        Location(
            name: "Total energie",
            cityName: "Nebeul",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "borne1",
                "borne2",
                
            ]
        )
    ]
}
