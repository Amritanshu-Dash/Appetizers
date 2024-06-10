//
//  ContentView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    var body: some View {
        
        TabView {
            
            AppetizerListView().tabItem {
                Image(systemName: "house.circle.fill")
                Text("Home")
            }
            
            AccountView().tabItem {
                Image(systemName: "person.circle.fill")
                Text("Account")
            }
            
            OrderView().tabItem {
                Image(systemName: "bag.circle.fill")
                Text("Order")
            }
            
        }
        .accentColor(.BrandPrimary)
        
    }
    
}

#Preview {
    AppetizerTabView()
}
