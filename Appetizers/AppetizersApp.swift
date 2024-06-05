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
    
    // return scene
    var body: some Scene {
        
        // every time we launch the appetizers app the new window it be organised with whats in the windowgroup......
        WindowGroup {
            AppetizerTabView()
        }
    }
}
