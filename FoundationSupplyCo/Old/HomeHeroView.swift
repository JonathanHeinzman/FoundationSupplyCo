//
//  HomeHeroView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct HomeHeroView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            WordmarkView()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            Text(String(localized: "Quality seating for churches—priced with stewardship in mind."))
                .font(.system(size: 28, weight: .bold))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(String(localized: "Built for high-use worship and gathering spaces."))
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            
            NavigationLink {
                ChairListView()
            } label: {
                Text(String(localized: "Browse Chairs"))
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.fscBrown)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            Image("hero-chairs")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 22))
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    HomeHeroView()
}
