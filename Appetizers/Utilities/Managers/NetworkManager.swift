//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 05/06/24.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager() // singleton
    
        // cache to not download images repeatedly while scrolling up and down through the app
    private let cache = NSCache<NSString, UIImage>() // key value pair that we are expecting in our cache is NSString->identifier and UIImage at the identifier ....
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    
    
    private init(){}
    
        // result has both success case -> appetizers and failure case -> APError
        //MARK: -- OLD GET APPETIZERS NETWORK MANAGER FUNCTION HERE .... ..... ....... .......
        //    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        //
        //        //checks if the url is okay or not
        //        guard let url = URL(string: appetizerURL) else {
        //            completed(.failure(.invalidURL))
        //            return
        //        }
        //
        //        //data task to download the information or network call with url request
        //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
        //
        //            // when wifi not working one example // if error has value means error exists with guard let vice-versa will happen that is if errpr has value then it will pass and if no value means no error then it will throw error
        //            if let _ = error {
        //                completed(.failure(.unableToComplete))
        //                return
        //            }
        //
        //            // 200 when thing go good
        //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        //                completed(.failure(.invalidResponse))
        //                return
        //            }
        //
        //            // check if data is there or not
        //            guard let data = data else {
        //                completed(.failure(.invalidData))
        //                return
        //            }
        //
        //            do {
        //                let decoder = JSONDecoder()
        //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
        //                completed(.success(decodedResponse.request))
        //            }
        //            catch {
        //                completed(.failure(.invalidData))
        //            }
        //
        //        }
        //        task.resume()
        //
        //    }
    
        //MARK: -- NEW GET APPETIZERS NETWORK MANAGER FUNCTION with async and swift concurrency techniques...
    
    func getAppetizers() async throws -> [Appetizer] {
        
            // this is a function that returns an appetizer list as it return type and if any error occurs then it throws returns the error ....
            // here it is not compulsory to write throws as we want to throw error we have mentioned throws in the function signature ... 
            //checks if the url is okay or not
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
            // a lot of lines form the old codes has been reduced and we dont manually have to handle every case here
            // this current line below this comment autmatically fetches data and response if not any error occurs it throws it on its own we dont have to handle it exceptionally like in the previous code ......
            // also here the code awaits and await is use after that try is used if it okay then it proceeds further in the code else throws error .... ... ...
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        }
        catch {
            throw APError.invalidData
        }
        
    }
    
    func downloadImage(fromURLString URLString : String, completed: @escaping(UIImage?)->Void) {
        
        let cacheKey = NSString(string: URLString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: URLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
                // first check if data is okay then checks if image is okay
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey) // sets item in cache
            completed(image)
            
        }
        
        task.resume()
        
    }
    
}
