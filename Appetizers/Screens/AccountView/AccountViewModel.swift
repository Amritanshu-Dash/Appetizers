//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    // saves data at the key User in userdefaults
    @AppStorage("User") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveDetails() {
        guard isValidForm else{return}
        
        do {
            // converts the data we have using json encoder to save it in data
            let data = try JSONEncoder().encode(user)
            // after json it is then savaed into userdefaults
            userData = data
            // an alert is popedup to let user know of successful storage of the datas........
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invaliduserData
        }
        
    }
    
    func retrieveDetails() {
        guard let userData = userData else {return}
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        catch {
            alertItem = AlertContext.invaliduserData
        }
    }
    
    var isValidForm: Bool {
        guard (!user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty) else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard (user.email.isValidEmail) else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    
}
