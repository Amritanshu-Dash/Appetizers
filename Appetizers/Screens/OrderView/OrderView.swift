//
//  OrderView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = mockData.sampleAppetizers
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems){
                            appetizer in AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            orderItems.remove(atOffsets: indexSet) // basically when we swip to delete an item it will recognise the index of the item we are going to delete and the orderItem.remove() will be called at that index 
                        })
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    Button{
                        print("YEs")
                    }label: {
                        buttonCoreDesign(title: "$566727 - Place Order")
                    }
                    .padding()
                }
                
                if (orderItems.isEmpty) {
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
