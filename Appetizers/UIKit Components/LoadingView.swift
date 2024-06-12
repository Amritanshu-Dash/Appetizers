//
//  LoadingView.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 08/06/24.
//

import SwiftUI

//struct ActivityIndicator: UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        
//        let activityIndicatorView = UIActivityIndicatorView(style: .large)
//        activityIndicatorView.color = UIColor.BrandPrimary
//        activityIndicatorView.startAnimating()
//        return activityIndicatorView
//        
//    }
//    
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
//    
//}

struct LoadingView: View {
    
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .teal))
                    .scaleEffect(5.1)
                    .padding(.bottom, 50)
                Text("LOADING")
                    .foregroundStyle(.pink)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
            }
        }
        
    }
    
}

#Preview {
    LoadingView()
}
