//
//  ChairCardView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ChairCardView: View {
    let chair: Chair
    
    var body: some View {
        HStack(spacing: 14) {
            
            Image(chair.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 82, height: 82)
                .padding(8)
                .background(Color.brown.opacity(0.10))
                .clipShape(RoundedRectangle(cornerRadius: 18))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(chair.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                
                Text(chair.price)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brown)
                
                Text(chair.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                Text("Learn more")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brown)
            }
            
            Spacer()
        }
        .padding(14)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}
