//
//  Appetizer.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/23/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Test Appetizer",
        description: "Appetizer's description",
        price: 23.50,
        imageURL: "",
        calories: 500,
        protein: 90,
        carbs: 100)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(
        id: 0001,
        name: "Test Appetizer One",
        description: "Appetizer's description",
        price: 23.50,
        imageURL: "",
        calories: 500,
        protein: 90,
        carbs: 100)
    
    static let orderItemTwo = Appetizer(
        id: 0002,
        name: "Test Appetizer Two",
        description: "Appetizer's description",
        price: 23.50,
        imageURL: "",
        calories: 500,
        protein: 90,
        carbs: 100)
    
    static let orderItemThree = Appetizer(
        id: 0003,
        name: "Test Appetizer Three",
        description: "Appetizer's description",
        price: 23.50,
        imageURL: "",
        calories: 500,
        protein: 90,
        carbs: 100)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
