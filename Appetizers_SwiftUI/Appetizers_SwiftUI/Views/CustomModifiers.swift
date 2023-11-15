//
//  CustomModifiers.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/27/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(100)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

struct StandardListCellStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}

extension View {
    func standardListCellStyle() -> some View {
        self.modifier(StandardListCellStyle())
    }
}
