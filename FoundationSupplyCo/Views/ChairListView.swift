//
//  ChairListView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ChairListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Shop Chairs")
                            .font(.fscHero)
                            .foregroundStyle(Color.fscDark)
                        
                        Text("High-quality church seating designed for worship and gathering spaces.")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 8)
                    
                    ForEach(chairData) { chair in
                        NavigationLink {
                            ChairDetailView(chair: chair)
                        } label: {
                            LargeChairCardView(chair: chair)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .background(Color.fscCream)
            .navigationTitle("Shop")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
