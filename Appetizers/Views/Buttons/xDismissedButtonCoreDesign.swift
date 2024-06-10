//
//  xDismissedButtonCoreDesign.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 10/06/24.
//

import SwiftUI

struct xDismissedButtonCoreDesign: View {
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.74)
            
            Image(systemName: "xmark")
                .imageScale(.large)
                .frame(width: 54, height: 54)
                .foregroundColor(.black)
            
        }
        
    }
    
}

#Preview {
    xDismissedButtonCoreDesign()
}
