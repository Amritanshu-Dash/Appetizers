//
//  EmptyState.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            VStack {
                Image("empty-order")
                    .resizable()
                    .scaledToFit()
                
                Text("No orders in your cart please add items.")
                    .font(.title2)
                    .bold()
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.cyan)
            }
            
        }
    }
}

#Preview {
    EmptyState()
}
