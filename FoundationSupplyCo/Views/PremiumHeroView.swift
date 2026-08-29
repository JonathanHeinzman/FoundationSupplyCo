//
//  PremiumHeroView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct PremiumHeroView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            WordmarkView()

            Text("Quality seating for churches—priced with stewardship in mind.")
                .font(.fscHero)
                .foregroundStyle(Color.fscDark)
                .fixedSize(horizontal: false, vertical: true)

            Text("Built for high-use worship and gathering spaces.")
                .font(.headline)
                .foregroundStyle(.secondary)

            Image("hero-chairs")
                .resizable()
                .scaledToFill()
                .frame(height: 210)
                .frame(maxWidth: .infinity)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 24))

            NavigationLink {
                ChairListView()
            } label: {
                PrimaryButton(title: "Browse Chairs")
            }
        }
        .padding(22)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.08), radius: 14, x: 0, y: 7)
    }
}
