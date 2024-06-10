//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 05/06/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            
            // as swiftui is different from uikit therefore if we donot write DispatchQueue.main.async then the switch will happen in background thread but that has to happen in main thread because setting the data is basically triggering an ui update so need to happen on main thread
            
            // in swiftui the ui upadte happens in main thread only........
            DispatchQueue.main.async { [self] in // here [self] in so that in the .failure switch case i dont have to explicilty define all alert items for self.
                isLoading = false
                switch result {
                    
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        break
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        break
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        break
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        break
                    }
                    
                }
            }
            
        }
    }
}
