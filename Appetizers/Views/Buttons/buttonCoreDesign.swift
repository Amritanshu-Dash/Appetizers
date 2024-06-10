//
//  buttonCoreDesign.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 10/06/24.
//

import SwiftUI

struct buttonCoreDesign: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        
        Text(title)
            .font(.subheadline)
            .fontWeight(.heavy)
            .frame(width: 260, height: 50)
            .foregroundStyle(.black)
            .background(.mint)
            .cornerRadius(12)
            .shadow(color: .white, radius: 7)
        
    }
    
}

#Preview {
    buttonCoreDesign(title: "Test title")
}
