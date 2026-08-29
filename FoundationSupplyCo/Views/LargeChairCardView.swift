//
//  LargeChairCardView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct LargeChairCardView: View {
    let chair: Chair

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(chair.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .padding(12)
                .background(Color.fscCream)

            VStack(alignment: .leading, spacing: 8) {
                Text(chair.name)
                    .font(.title3)
                    .fontWeight(.bold)

                Text(chair.price)
                    .font(.headline)
                    .foregroundStyle(Color.fscBrown)

                Text(chair.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("Learn More →")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.fscBrown)
            }
            .padding(16)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}
