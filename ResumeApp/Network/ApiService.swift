//
//  ApiService.swift
//  ResumeApp
//
//  Created by Jair Moreno Gaspar on 4/30/19.
//  Copyright © 2019 Jair Moreno Gaspar. All rights reserved.
//

import Foundation

class ApiService {
    
    static let sharedInstance = ApiService()
    
    func fetchForUrlString <T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        
        
        guard let url = URL(string: urlString) else {
            print(Errors.urlIncorrect)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 300
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else { return }
            
            do {
                let summary = try JSONDecoder().decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(summary))
                }
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
        task.resume()
        
    }
    
}
