//
//  ChairData.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import Foundation

let chairData = [
    Chair(
        name: String(localized: "The Foundation Chair"),
        imageName: "foundation-chair",
        price: String(localized: "Starting at $36"),
        subtitle: String(localized: "Built for high-use worship and gathering spaces."),
        description: String(localized: "A durable, comfortable seating option designed for churches and nonprofits."),
        features: [
            String(localized:"Comfortable cushioning"),
            String(localized: "Steel frame"),
            String(localized: "Rear storage pocket"),
            String(localized: "Row connectors")
        ]
    ),
    Chair(
        name: String(localized: "The Essentials Chair"),
        imageName: "essentials-chair",
        price: String(localized: "Starting at $31.50"),
        subtitle: String(localized: "Simple, durable, and affordable."),
        description: String(localized: "A practical chair option for churches needing quality seating at a lower price."),
        features: [
            String(localized: "Durable frame"),
            String(localized: "Comfortable seat"),
            String(localized: "Simple design"),
            String(localized: "Great value")
        ]
    ),
    Chair(
        name: String(localized: "The Value Chair"),
        imageName: "value-chair",
        price: String(localized: "Starting at $29"),
        subtitle: String(localized: "Affordable seating for ministry spaces."),
        description: String(localized: "A budget-friendly option for churches, classrooms, and gathering spaces."),
        features: [
            String(localized: "Lowest starting price"),
            String(localized: "Lightweight"),
            String(localized: "Stackable"),
            String(localized: "Easy to maintain")
        ]
    ),
    Chair(
        name: String(localized: "The Premier Chair"),
        imageName: "premier-chair",
        price: String(localized: "Starting at $41"),
        subtitle: String(localized: "Premium comfort and durability."),
        description: String(localized: "An upgraded seating option with added comfort and commercial-grade materials."),
        features: [
            String(localized: "Commercial-grade fabric"),
            String(localized: "Rear book pocket"),
            String(localized: "Row connectors"),
            String(localized: "Extra comfort")
        ]
    )
]
