//
//  HeroSection.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            Image("hero-chairs")
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .frame(maxWidth: .infinity)
                .clipped()

            VStack(alignment: .leading, spacing: 16) {

                Text("Foundation Supply Co.")
                    .font(.headline)
                    .foregroundStyle(.brown)

                Text("Quality seating for churches—priced with stewardship in mind.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Built for high-use worship and gathering spaces.")
                    .font(.headline)
                    .foregroundStyle(.secondary)

                NavigationLink {
                    ChairListView()
                } label: {
                    Text("Shop Chairs")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.fscBrown)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }

            }
            .padding(24)

        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(radius: 6)
    }
}
