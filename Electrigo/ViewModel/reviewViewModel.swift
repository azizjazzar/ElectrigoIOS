//
//  reviewViewModel.swift
//  Electrigo
//
//  Created by Aissa Dhia on 17/11/2023.
//

import Foundation
class reviewViewModel : ObservableObject{
    @Published var locations: [Review] = []
    
    
    func addLocation(_ review: Review) {
        // Create an instance of JSONEncoder
        let encoder = JSONEncoder()
        
        // Convert the Location structure into JSON data
        guard let jsonData = try? encoder.encode(review) else {
            fatalError("Error encoding to JSON")
        }
        
        // Create a URLRequest with your API URL
        let url = URL(string: "http://192.168.100.160:3000/api/review/addreview")! // Replace with your URL
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
}
