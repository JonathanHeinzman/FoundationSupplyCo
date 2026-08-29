//
//  FeaturedChairSection.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct FeaturedChairSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("Featured Collection")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink("View All") {
                    ChairListView()
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.fscBrown)
            }
            .padding(.horizontal, 8)
            
            ForEach(chairData) { chair in
                NavigationLink {
                    ChairDetailView(chair: chair)
                } label: {
                    LargeChairCardView(chair: chair)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}
