//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
                //            AppetizerRemoteImage(urlString: appetizer.imageURL)
                //                .aspectRatio(contentMode: .fit)
                //                .frame(width: 120, height: 90)
                //                .cornerRadius(8)
            
            //MARK: -- ASYNC IMAGE METHOD INSTEAD OF THE REMOTE IMAGE METHOD IT IS EASIER TO USE . ..
            //The difference between async and this our own implemented method is that ASYNC doesnot have a cache method so in the remoteImage method a cache functionality is there that check if the image is present in the cache memory it doesnot download it and if not then it stores in cache for further use improving network efficiceny but asyncImage method doesnot do it . .. .
            AsyncImage( url: URL(string: appetizer.imageURL),
                        content: {
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        },
                        placeholder: {
                            Image("food-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 90)
                                .cornerRadius(8)
                        }
            )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: mockData.sampleAppetizer)
    }
}
