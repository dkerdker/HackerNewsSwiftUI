//
//  NetworkManager.swift
//  HACKERNEWSPROJECT
//
//  Created by Dee Ker Khoo on 30/03/2020.
//  Copyright © 2020 Dee Ker MacOS. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        //1. Create a URL
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task           //Closure
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
}
