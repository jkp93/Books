//
//  NetworkService.swift
//  Book
//
//  Created by 박중권 on 5/9/24.
//

import Foundation

class NetworkService {
    
    
    
    private let apiKey = "8ab801005222d9f21493fc803f80ec7f"
    
    
    
    
    func searchBooks(query: String, completition: @escaping(Result<Model, Error>) -> Void) {
        
        let urlString = "https://dapi.kakao.com/v3/search/book?target=title"
        let headers = ["Authorization" : "KakaoAK \(apiKey)"]
        
        var urlComponent = URLComponents(string: urlString)
        
        urlComponent?.queryItems?.append(URLQueryItem(name: "query", value: query))
        guard let url = urlComponent?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completition(.failure(error))
            }
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(Model.self, from: data) {
                    print(decodedData)
                    completition(.success(decodedData))
                }
            }
        }
        task.resume()
    }
    
    
}

