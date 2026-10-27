
//
//  Brand.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

extension Color {
    
    // Original brand colors
    static let fscBrown = Color(red: 0.42, green: 0.27, blue: 0.17)
    static let fscCream = Color(red: 0.96, green: 0.93, blue: 0.88)
    static let fscDark = Color(red: 0.13, green: 0.11, blue: 0.09)
    static let fscTan = Color(red: 0.82, green: 0.70, blue: 0.56)
    
    // Light and dark mode colors
    static let fscBackground = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1)
            : UIColor(red: 0.91, green: 0.89, blue: 0.86, alpha: 1)
        }
    )
    
    static let fscSurface = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1)
            : .white
        }
    )
    
    static let fscText = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
            ? .white
            : UIColor(red: 0.13, green: 0.11, blue: 0.09, alpha: 1)
        }
    )
    
    static let fscAccent = Color(
        uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.82, green: 0.70, blue: 0.56, alpha: 1)
            : UIColor(red: 0.42, green: 0.27, blue: 0.17, alpha: 1)
        }
    )
}

extension Font {
    static let fscHero = Font.system(size: 32, weight: .bold)
    static let fscTitle = Font.system(size: 24, weight: .bold)
    static let fscSection = Font.system(size: 21, weight: .semibold)
}
