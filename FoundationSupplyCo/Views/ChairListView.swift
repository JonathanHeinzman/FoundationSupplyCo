//
//  ChairListView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ChairListView: View {

    @Binding var chairToOpen: Chair?

    init(chairToOpen: Binding<Chair?> = .constant(nil)) {
        self._chairToOpen = chairToOpen
    }

    @State private var selectedChair: Chair?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Explore Our Chairs")
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.fscText)

                        Text("Quality seating for churches and organizations.")
                            .foregroundStyle(.secondary)
                    }

                    // Chair Catalog
                    ForEach(chairData) { chair in
                        Button {
                            selectedChair = chair
                        } label: {
                            VStack(alignment: .leading, spacing: 12) {
                                Image(chair.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 220)

                                Text(chair.name)
                                    .font(.title3.bold())
                                    .foregroundStyle(Color.fscText)

                                Text(chair.price)
                                    .font(.headline)
                                    .foregroundStyle(Color.fscAccent)

                                Label(
                                    "View Details",
                                    systemImage: "arrow.right"
                                )
                                .font(.subheadline)
                                .foregroundStyle(Color.fscAccent)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.fscSurface)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(maxWidth: 650)
                .padding(20)
                .frame(maxWidth: .infinity)
            }
            .background(Color.fscBackground)
            .navigationTitle("Chairs")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $selectedChair) { chair in
                ChairDetailView(chair: chair)
            }
            .onChange(of: chairToOpen) { _, newChair in
                if let newChair {
                    selectedChair = newChair
                    chairToOpen = nil
                }
            }
        }
    }
}
