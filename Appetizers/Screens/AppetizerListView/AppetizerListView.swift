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
                
                    appetizer in AppetizerListCell(appetizer: appetizer)
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
//            .onAppear{
//                viewModel.getAppetizers() // so when navigation stack appears we will make the network call and get appetizers data
//            }
// MARK: - The reason we are doing task instead of .onAppear is because it will put it in async context which means if user goes out of screen before network call it will automatically cancel it .... ... ... .. .. . .. .. .. .. .. . .. . .
            .task {
                viewModel.getAppetizers()
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
