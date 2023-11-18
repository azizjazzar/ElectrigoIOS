//
//  LocationlistViewModel.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import Foundation
import MapKit
import CoreLocation
class locationlistViewModel:ObservableObject {
    @Published var locations: [Location] = []

    @Published var CoordinateRegion = MKCoordinateRegion()
    @Published var MapLocation : Location{
        didSet{
            updateCoordinateRegion(location:MapLocation)
        }
    }
    var locationManager: LocationManager
    @Published var isListDisplayed = false
    //@State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 24.59, longitude: 46.70), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    init(){
        self.locationManager = LocationManager()
        let location =  LocationsDataService.locations
        locations=location
        MapLocation = LocationsDataService.locations.first!
       self.updateCoordinateRegion(location: locations.first!)
        
    }
    
    func updateCoordinateRegion(location: Location) {
        let coordinate = location.coordinate.coordinate // Use the coordinate property
        CoordinateRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }

    func updateListState(){
        isListDisplayed.toggle()
    }
    func addLocation(_ location: Location) {
        // Create an instance of JSONEncoder
        let encoder = JSONEncoder()
        
        // Convert the Location structure into JSON data
        guard let jsonData = try? encoder.encode(location) else {
            fatalError("Error encoding to JSON")
        }
        
        // Create a URLRequest with your API URL
        let url = URL(string: "http://192.168.100.160:3000/api/borne/addborne")! // Replace with your URL
        var request = URLRequest(url: url)
        
        // Configure the request as a POST and set the request body
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Use URLSession to send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                return
            }
            
            // Process the response of the request
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                if let responseData = data {
                    // Process response data if needed
                    let responseString = String(data: responseData, encoding: .utf8)
                    print("Response: \(responseString ?? "")")
                }
            }
        }
        
        // Start the request
        task.resume()
    }
    
    func getLocations() {
           getLocations { [weak self] fetchedLocations in
               if let fetchedLocations = fetchedLocations {
                   DispatchQueue.main.async {
                       self?.locations = fetchedLocations
                   }
               }
           }
       }

       private func getLocations(completion: @escaping ([Location]?) -> Void) {
           let url = URL(string: "http://192.168.100.160:3000/api/borne/bornes")!
           var request = URLRequest(url: url)
           request.httpMethod = "GET"

           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let error = error {
                   print("Request error: \(error.localizedDescription)")
                   completion(nil)
                   return
               }

               if let httpResponse = response as? HTTPURLResponse {
                   print("HTTP Status Code: \(httpResponse.statusCode)")

                   guard let responseData = data else {
                       print("No data received")
                       completion(nil)
                       return
                   }

                   // Print the response string
                   let responseString = String(data: responseData, encoding: .utf8)
                   print("Response String: \(responseString ?? "")")

                   do {
                       let decoder = JSONDecoder()
                       decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let locations = try decoder.decode([Location].self, from: responseData)
                       completion(locations)
                   } catch {
                       print("Error decoding JSON: \(error.localizedDescription)")
                       completion(nil)
                   }
               }
           }

           task.resume()
       }
   }


    
    

    







