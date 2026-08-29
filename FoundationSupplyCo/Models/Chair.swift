//
//  Chair.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import Foundation

struct Chair: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: String
    let subtitle: String
    let description: String
    let features: [String]
}
