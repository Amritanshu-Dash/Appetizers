//
//  OrderView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items){
                            appetizer in AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.deleteItems(at: indexSet) // .onDelete(perform: order.deleteItems) this can also work ...... 
                        })
                        
                       
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button{
                        print("YEs")
                    }label: {
                        buttonCoreDesign(title: "\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding()
                }
                
                if (order.items.isEmpty) {
                    EmptyState()
                }
            }
            .navigationTitle("Order Details")
        }
        
    }
    
}

#Preview {
    OrderView()
}
