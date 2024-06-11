//
//  UserData.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import Foundation

struct UserData: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
    var alertItem: AlertItem?
}
