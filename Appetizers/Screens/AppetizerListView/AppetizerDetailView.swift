//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 10/06/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order // it assumes that this is present in the environment and it will try to get it if not app will crash ..... 
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
       
        VStack {
            
            // we wont be downloading images again as we put these in the cache with image url as identifier
            // first step of download image in network manager file is to store the image in cache memory or pull it from cache if we have it
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)
                .padding(.all)
            
            VStack {
                
                Text(appetizer.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.cyan)
                
                Text(appetizer.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.cyan)
                    .padding(.bottom, 7)
                
                HStack(spacing: 40) {
                    
                    nutritionInformation(nutritionName: "Calories", nutritionAmount: "\(appetizer.calories)")
                    nutritionInformation(nutritionName: "Protein", nutritionAmount: "\(appetizer.protein)")
                    nutritionInformation(nutritionName: "Carbs", nutritionAmount: "\(appetizer.carbs)")
                    
                }
                
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
            } label: {buttonCoreDesign(title: "\(appetizer.price, specifier: "%.2f") - Add to Order")}
            .padding(.bottom, 35)
            
        }
        .frame(width: 320, height: 525)
        .background(Color(.black))
        .cornerRadius(42)
        .shadow(color: .BrandPrimary, radius: 102)
        .overlay(Button {isShowingDetailView = false} label: {xDismissedButtonCoreDesign()}, alignment: .topTrailing)
        
    }
    
}

struct AppetizerDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppetizerDetailView(appetizer: mockData.sampleAppetizer, isShowingDetailView: .constant(true))
    }
    
}
