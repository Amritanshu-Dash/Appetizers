//
//  AccountView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                        .autocorrectionDisabled(true)
                        .keyboardType(.alphabet)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .autocorrectionDisabled(true)
                        .keyboardType(.alphabet)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                    
                    DatePicker("Birth Day", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveDetails()
                    }label: {
                        Text("Save Details")
                            .bold()
                            .font(.title3)
                            
                    }
                    
                }
                
                Section(header: Text("Requests")) {
                    
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        // .toggleStyle(SwitchToggleStyle(tint: .BrandPrimary))
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                        // .toggleStyle(SwitchToggleStyle(tint: .BrandPrimary))
                }
                .toggleStyle(SwitchToggleStyle(tint: .BrandPrimary))
                
            }
            
            .navigationTitle("Account")
        }
        .onAppear{viewModel.retrieveDetails()}
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissedButton)
        }
        
        
        
    }
    
}

#Preview {
    AccountView()
}
