//
//  nutritionInformation.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 10/06/24.
//

import SwiftUI

struct nutritionInformation: View {
    
    let nutritionName: String
    let nutritionAmount: String
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(nutritionName)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.mint)
            
            Text(nutritionAmount)
                .font(.subheadline)
                .italic()
                .fontWeight(.bold)
                .foregroundStyle(.mint)
        }
        
    }
    
}

#Preview {
    nutritionInformation(nutritionName: "Asdfghhjkl", nutritionAmount: "12345")
}
