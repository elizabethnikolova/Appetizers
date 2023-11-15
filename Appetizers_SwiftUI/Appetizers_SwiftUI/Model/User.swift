//
//  User.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/27/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkings = false
    var frequentRefills = false
}
