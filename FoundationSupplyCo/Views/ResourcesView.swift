//
//  ResourcesView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ResourcesView: View {
    
    let resources = [
        "How to Choose the Right Chairs for Your Church",
        "How Many Chairs Do You Really Need?",
        "How to Upgrade Your Seating Without Blowing the Budget",
        "Common Mistakes Churches Make When Buying Chairs",
        "Why Buying Direct Saves Organizations Thousands"
    ]
    
    var body: some View {
        NavigationStack {
            List(resources, id: \.self) { resource in
                VStack(alignment: .leading, spacing: 6) {
                    Text(resource)
                        .font(.headline)
                    
                    Text("Helpful seating advice for churches and nonprofits.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("Resources")
        }
    }
}
