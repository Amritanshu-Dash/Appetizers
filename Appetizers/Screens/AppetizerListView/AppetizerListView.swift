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
        
        ZStack {

            NavigationStack {
                
                List(viewModel.appetizers) {
                
                    appetizer in HStack {
                        
                        AppetizerRemoteImage(urlString: appetizer.imageURL)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 90)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(appetizer.name)
                                .font(.title2)
                                .fontWeight(.heavy)
                            
                            Text("$ \(appetizer.price, specifier: "%.2f")")
                                .foregroundStyle(.secondary)
                                .fontWeight(.heavy)
                            
                        }
                        .padding(.leading)
                        
                    }
                    .listRowSeparatorTint(.BrandPrimary)
                    .onTapGesture {
                        viewModel.selectedAppetizer = appetizer
                        viewModel.isShowingDetailView = true
                    }
                    .padding()
                    
                }
                .disabled(viewModel.isShowingDetailView)
                .navigationTitle("Appetizers 🍣 🍤")
                
            }
            .blur(radius: viewModel.isShowingDetailView ? 12 : 0)
            .onAppear{
                viewModel.getAppetizers() // so when navigation stack appears we will make the network call and get appetizers data
            }
            
            if (viewModel.isShowingDetailView) {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
            if (viewModel.isLoading) {
                LoadingView()
            }
            
        }
        .alert( item: $viewModel.alertItem, content: { alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissedButton)} )
        
    }

}

#Preview {
    AppetizerListView()
}
