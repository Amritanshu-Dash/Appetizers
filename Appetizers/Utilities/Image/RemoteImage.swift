//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 09/06/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil // type swiftui image not uikit uiimage type, this will also trigger an ui change so we have to dispatch this variable to the main queue after updating it.....
    
    func load(fromURLString urlString: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { 
            
            uiImage in guard let uiImage = uiImage else {
                return
            }
            
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
            
        }
        
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        
        image?.resizable() ?? Image("food-placeholder").resizable()
        
    }
    
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        
        RemoteImage(image: imageLoader.image)
            .onAppear{ imageLoader.load(fromURLString: urlString) }
        
    }
    
}
