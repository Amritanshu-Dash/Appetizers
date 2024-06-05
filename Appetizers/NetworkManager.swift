//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 05/06/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager() // singleton
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    
    private init(){}
    
    
    // result has both success case -> appetizers and failure case -> APError
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void){
        
        //checks if the url is okay or not
        guard let url = URL(string: appetizerURL) else{
            completed(.failure(.invalidURL))
            return
        }
        
        //data task to download the information or network call with url request
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            
            // when wifi not working one example
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            // 200 when thing go good
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // check if data is there or not
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
