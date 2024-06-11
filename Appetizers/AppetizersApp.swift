//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 03/06/24.
//

import SwiftUI

@main // entry point to the program..............
// app confirms to main through it class extension
struct AppetizersApp: App {
    
    var order = Order()
    // return scene
    var body: some Scene {
        
        // every time we launch the appetizers app the new window it be organised with whats in the windowgroup......
        WindowGroup {
            AppetizerTabView().environmentObject(order) // we are injecting and environmental object here so that all the child of this appetizer tab view can have access to . . .
        }
        
    }
    
}
