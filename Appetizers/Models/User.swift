//
//  User.swift
//  Appetizers
//
//  Created by Amritanshu Dash on 11/06/24.
//

import Foundation

struct User: Codable {
    
    // when storing custom object to user default we have to convert it to data first user default can deal with but some user defined data types for that User has to confirm to encodable and decodable that is together we say as codabel

    // user -> data -> userdefaults --- encoding ---->
                                                    //------> together codable
    // user <- data <- userdefaults --- decoding ---->

    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
    
}

