//
//  HomeView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 26) {
                    PremiumHeroView()
                    QuickActionRow()
                    FeaturedChairSection()
                    MissionCard()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .background(colorScheme == .dark ? Color.fscDark : Color.fscCream)
            .navigationTitle("Foundation Supply Co.")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
}
