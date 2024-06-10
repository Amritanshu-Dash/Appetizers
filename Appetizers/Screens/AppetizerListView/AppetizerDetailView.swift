//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 10/06/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    var body: some View {
       
        VStack {
            Image("food-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
                .clipShape(Circle())
            
            VStack {
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.cyan)
                
                Text(appetizer.description)
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.cyan)
                    .padding()
                
                HStack(spacing: 40) {
                    
                    VStack(spacing: 5) {
                        Text("Calories")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                        
                        Text("\(appetizer.calories)")
                            .font(.subheadline)
                            .italic()
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                        
                        Text("\(appetizer.protein)")
                            .font(.subheadline)
                            .italic()
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                        
                        Text("\(appetizer.carbs)")
                            .font(.subheadline)
                            .italic()
                            .fontWeight(.bold)
                            .foregroundStyle(.mint)
                    }
                }
            }
            
            Spacer()
            Button {
                print("Tapped")
            } label: {
                Text("Save")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.black)
                    .background(.mint)
                    .cornerRadius(12)
                    .shadow(color: .white, radius: 7)
            }
            .padding(.bottom, 35)
        }
        .frame(width: 320, height: 525)
        .background(Color(.black))
        .cornerRadius(42)
        .shadow(color: .BrandPrimary, radius: 102)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: mockData.sampleAppetizer)
    }
}
