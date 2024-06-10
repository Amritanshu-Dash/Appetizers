//
//  Alert.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 08/06/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissedButton: Alert.Button
    
}

struct AlertContext {
    
    static let invalidData = AlertItem (    
                                        title: Text("Data Error!"),
                                        message: Text("The data received from the server is invalid. Contact support."),
                                        dismissedButton: .default(Text("Okay"))
                                    )
    
    
    static let invalidResponse = AlertItem (
                                            title: Text("Response Error!"),
                                            message: Text("Inavlid response request. Try again later or contact support."),
                                            dismissedButton: .default(Text("Okay"))
                                        )
    
    
    static let invalidURL = AlertItem (
                                        title: Text("Not a valid URL request. Check URL."),
                                        message: Text("URL is not valid to have a connection with the server. Try later and if the issue persists contact support."),
                                        dismissedButton: .default(Text("Okay"))
                                    )
    
    
    static let unableToComplete = AlertItem (
                                                title: Text("Unable to complete the request at the moment."),
                                                message: Text("Uanble to complete the network request at the moment check your internet connection and if it persists contact your network provider and if the connection of your internet is stable the contact the help center for assistance in resolving the issue."),
                                                dismissedButton: .default(Text("Okay"))
                                        )
    
}

