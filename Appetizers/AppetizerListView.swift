//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        NavigationStack{
            List(viewModel.appetizers){
                appetizer in HStack{
                    
                    Image("")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 90)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(appetizer.name)
                            .font(.title2)
                            .fontWeight(.heavy)
                        
                        Text("$ \(appetizer.price, specifier: "%.2f")")
                            .foregroundStyle(.secondary)
                            .fontWeight(.heavy)
                        
                    }.padding(.leading)
                    
                }
                .padding()
            }
        }
        .onAppear{
            viewModel.getAppetizers()
            // so when navigation stack appears we will make the network call and get appetizers data
        }
    }
    
    
}

#Preview {
    AppetizerListView()
}
