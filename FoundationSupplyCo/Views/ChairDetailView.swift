//
//  ChairDetailView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
// test

import SwiftUI

struct ChairDetailView: View {
    let chair: Chair

    @Environment(\.requestQuote) private var requestQuote

    // Add more chair images here later
    private var chairImages: [String] {
        [chair.imageName]
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // Chair Image Gallery
                TabView {
                    ForEach(chairImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .background(Color.fscSurface)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // Chair Information
                VStack(alignment: .leading, spacing: 12) {
                    Text(chair.name)
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.fscText)

                    Text(chair.price)
                        .font(.title2.bold())
                        .foregroundStyle(Color.fscAccent)

                    Text(chair.subtitle)
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    Divider()

                    Text("Product Details")
                        .font(.title2.bold())
                        .foregroundStyle(Color.fscText)

                    Text(chair.description)
                        .foregroundStyle(Color.fscText)
                }

                // Request a Quote
                Button {
                    requestQuote(chair.name)
                } label: {
                    Label("Request a Quote", systemImage: "doc.text")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.fscBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: 650)
            .padding(20)
            .frame(maxWidth: .infinity)
        }
        .background(Color.fscBackground)
        .navigationTitle(chair.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChairDetailView(chair: chairData[0])
    }
}
