//
//  Appetizers_SwiftUIApp.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/23/23.
//

import SwiftUI

@main
struct Appetizers_SwiftUIApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
