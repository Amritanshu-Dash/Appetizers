//
//  Appetizer.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    
    let protein: Int
    let carbs: Int
    let description: String
    let id = UUID()
    let imageURL: String
    let name: String
    let calories: Int
    let price: Double
    
}

struct AppetizerResponse: Decodable {
    
    let request: [Appetizer]
    
}

struct mockData {
    
    static let sampleAppetizer = Appetizer(protein: 20, carbs: 300, description: "AAAA", imageURL: "", name: "Aaa", calories: 87, price: 234.90)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let sampleAppetizerOne = Appetizer(protein: 20, carbs: 300, description: "AAAA", imageURL: "", name: "Aaa", calories: 87, price: 234.90)
    static let sampleAppetizerTwo = Appetizer(protein: 20, carbs: 300, description: "AAAA", imageURL: "", name: "Aaa", calories: 87, price: 234.90)
    static let sampleAppetizerThree = Appetizer(protein: 20, carbs: 300, description: "AAAA", imageURL: "", name: "Aaa", calories: 87, price: 234.90)
    static let sampleAppetizerFour = Appetizer(protein: 20, carbs: 300, description: "AAAA", imageURL: "", name: "Aaa", calories: 87, price: 234.90)
    
    static let sampleAppetizers = [sampleAppetizerOne, sampleAppetizerTwo, sampleAppetizerThree, sampleAppetizerFour]
}
