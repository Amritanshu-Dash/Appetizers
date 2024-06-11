//
//  ContentView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
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
            .badge(order.items.count)
            
        }
        
    }
    
}

#Preview {
    AppetizerTabView()
}
