//
//  ChairDetailView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ChairDetailView: View {
    let chair: Chair

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Image(chair.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 260)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))

                Text(chair.name)
                    .font(.fscHero)

                Text(chair.price)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.fscBrown)

                Text(chair.subtitle)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text(chair.description)
                    .foregroundStyle(.secondary)

                NavigationLink {
                    QuoteView(selectedChair: chair.name)
                } label: {
                    PrimaryButton(title: "Request a Quote")
                }
            }
            .padding(.horizontal, 16)
        }
        .background(Color.fscCream)
        .navigationTitle(chair.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
