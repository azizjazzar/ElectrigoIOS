//
//  ForumViewModel.swift
//  Electrigo
//
//  Created by dhia on 21/11/2023.
//

import Foundation

class ForumViewModel : ObservableObject {
    
    
    @Published var posts: [Post] = []
    
    init() {
        getAllposts()
          }
    
    func addPost(_ post:Post) {
            // Create an instance of JSONEncoder
            let encoder = JSONEncoder()
            
            // Convert the Location structure into JSON data
            guard let jsonData = try? encoder.encode(post) else {
                fatalError("Error encoding to JSON")
            }
            
            // Create a URLRequest with your API URL
            let url = URL(string: "http://192.168.100.160:3000/api/posts/posts")!
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
        
    
    func getAllposts() {
           guard let url = URL(string: "http://192.168.100.160:3000/api/posts/getposts") else {
               print("there is errors with url parsing")
               return
           }
           URLSession.shared.dataTask(with: url) { data, response, error in
               guard error == nil else {
                   print("error from completion handler")
                   return
               }
               
               guard let response = response as? HTTPURLResponse else {
                   print("error from response")
                   return
               }
               guard response.statusCode >= 200 && response.statusCode <= 300 else {
                   print ("error from status code")
                   return
               }
               guard let data = data?.jsonparsing(letters: "null,") else {
                   print("error with data")
                   return
               }
               guard let jsondata = try? JSONDecoder().decode([Post].self, from: data) else {
                   print("error from decoder")
                   return
               }
               

               DispatchQueue.main.async {
                   self.posts = jsondata
                   print(self.posts)
               }
               
           }.resume()
       }


}




