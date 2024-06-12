//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 05/06/24.
//

import SwiftUI

// this mainactor what is that is that anything happens ui related in the scope of this function will be rerouted to the main thread . .. . .. part of new network manager
@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
        //MARK: -- old network manager
        //    func getAppetizers() {
        //
        //        isLoading = true
        //
        //        NetworkManager.shared.getAppetizers { [self] result in
        //
        //            // as swiftui is different from uikit therefore if we donot write DispatchQueue.main.async then the switch will happen in background thread but that has to happen in main thread because setting the data is basically triggering an ui update so need to happen on main thread
        //
        //            // in swiftui the ui upadte happens in main thread only........
        //            DispatchQueue.main.async { [self] in // here [self] in so that in the .failure switch case i dont have to explicilty define all alert items for self.
        //
        //                isLoading = false
        //
        //                switch result {
        //
        //                    case .success(let appetizers):
        //                        self.appetizers = appetizers
        //
        //                    case .failure(let error):
        //
        //                        switch error {
        //
        //                            case .invalidData:
        //                                self.alertItem = AlertContext.invalidData
        //                                break
        //
        //                            case .invalidURL:
        //                                self.alertItem = AlertContext.invalidURL
        //                                break
        //
        //                            case .invalidResponse:
        //                                self.alertItem = AlertContext.invalidResponse
        //                                break
        //
        //                            case .unableToComplete:
        //                                self.alertItem = AlertContext.unableToComplete
        //                                break
        //
        //                        }
        //
        //                }
        //
        //            }
        //
        //        }
        //
        //    }
    
        //MARK: -- NEW NETWORK MANAGER
    func getAppetizers() {
        
        isLoading = true
        
            // this is an easy way for async function and this network call is async we can write async in function signature but a lot of changes has to happen . .. .. .
        // no weak self is also there as it did caused errors
        Task {
            // here we have to write do catch block because in networkmanager appetizers function we have mentioned async and throws so is it throws error then that will be handled by this catch block .. .. ..
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }
            catch {
                // if the error caught is of type APError .. then this statement of code will be executed . . ..
                if let apError = error as? APError {
                    switch apError {
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
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
        
        
    }
    
}
