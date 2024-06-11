//
//  Order.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    // here what we are doing is that we are going through the entire array and as we are traversing through it we are reduce it using reduce method and adding only price and returning it to totalPrice variable and storing it ..... 
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets) // basically when we swip to delete an item it will recognise the index of the item we are going to delete and the orderItem.remove() will be called at that index
    }
    
}
