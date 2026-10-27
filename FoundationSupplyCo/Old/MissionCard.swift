//
//  MissionCard.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct MissionCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Our Story")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Foundation Supply Company exists to help churches and nonprofits access high-quality seating at pricing that respects stewardship.")
            
            Text("Founded by a pastor and former church business administrator, our company was built from real ministry experience and a clear understanding of the challenges churches face when balancing quality, durability, and budget.")
                .foregroundStyle(.secondary)
            
            Text("Our goal is simple: to serve churches with clarity and care, so you can focus on your people and your mission.")
                .foregroundStyle(.secondary)
        }
        .font(.body)
        .padding(22)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 5)
    }
}
