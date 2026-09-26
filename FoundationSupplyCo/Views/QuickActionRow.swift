//
//  QuickActionRow.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct QuickActionRow: View {
    var body: some View {
        HStack(spacing: 12) {
            NavigationLink {
                QuoteView()
            } label: {
                QuickActionCard(title: String(localized: "Request Quote"), icon: "doc.text.fill")
            }
            .buttonStyle(.plain)
            
            NavigationLink {
                ContactView()
            } label: {
                QuickActionCard(title: String(localized:"Contact"), icon: "phone.fill")
            }
            .buttonStyle(.plain)
        }
    }
}

struct QuickActionCard: View {
    let title: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(Color.fscBrown)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.fscDark)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}
