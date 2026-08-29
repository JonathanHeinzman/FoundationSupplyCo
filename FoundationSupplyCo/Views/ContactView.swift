//
//  ContactView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    WordmarkView()
                    
                    Text("Contact Foundation Supply Co.")
                        .font(.fscHero)
                        .foregroundStyle(Color.fscDark)
                    
                    Text("Our goal is simple: to serve churches with clarity and care, so you can focus on your people and your mission.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Label("sales@foundationsupplyco.com", systemImage: "envelope.fill")
                        Label("(858) 757-0696", systemImage: "phone.fill")
                    }
                    .font(.headline)
                    
                    Link(destination: URL(string: "mailto:sales@foundationsupplyco.com")!) {
                        PrimaryButton(title: "Email Foundation Supply Co.")
                    }
                    
                    Link(destination: URL(string: "tel:8587570696")!) {
                        Text("Call Now")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.fscDark)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .background(Color.fscCream)
            .navigationTitle("Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
