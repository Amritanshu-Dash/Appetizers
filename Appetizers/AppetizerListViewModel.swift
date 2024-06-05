//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 05/06/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers(){
        
        NetworkManager.shared.getAppetizers { result in
            
            // as swiftui is different from uikit therefore if we donot write DispatchQueue.main.async then the switch will happen in background thread but that has to happen in main thread because setting the data is basically triggering an ui update so need to happen on main thread
            
            // in swiftui the ui upadte happens in main thread only........
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
            
        }
    }
}
