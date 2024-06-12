//
//  AccountView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    // focus helps go to the next input field submit label changes the return keyword to what is written ..
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                        .autocorrectionDisabled(true)
                        .keyboardType(.alphabet)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                        .autocorrectionDisabled(true)
                        .keyboardType(.alphabet)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    //DatePicker("Birth Day", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
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
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss", action: {focusedTextField = nil})
                }
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
