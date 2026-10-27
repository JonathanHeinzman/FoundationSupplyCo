//
//  HomeView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct HomeView: View {

    @Environment(\.openChair) private var openChair

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Welcome
                    VStack(alignment: .leading, spacing: 12) {
                        Text("FOUNDATION SUPPLY CO.")
                            .font(.subheadline.bold())
                            .foregroundStyle(Color.fscAccent)

                        Text("Seating Built for Your Mission")
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.fscText)

                        Text("Quality seating for churches and organizations.")
                            .foregroundStyle(.secondary)

                        Image("hero-chairs")
                            .resizable()
                            .scaledToFit()
                    }

                    // Featured Chairs
                    Text("Explore Our Chairs")
                        .font(.title2.bold())
                        .foregroundStyle(Color.fscText)

                    ForEach(chairData) { chair in
                        Button {
                            openChair(chair)
                        } label: {
                            HStack(spacing: 16) {
                                Image(chair.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 110)

                                VStack(alignment: .leading, spacing: 8) {
                                    Text(chair.name)
                                        .font(.headline)
                                        .foregroundStyle(Color.fscText)

                                    Text(chair.price)
                                        .font(.subheadline)
                                        .foregroundStyle(Color.fscAccent)

                                    Label(
                                        "View Details",
                                        systemImage: "arrow.right"
                                    )
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                }

                                Spacer()
                            }
                            .padding()
                            .background(Color.fscSurface)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16)
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    // Our Story
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Our Story")
                            .font(.title2.bold())
                            .foregroundStyle(Color.fscText)

                        Text("Founded by a pastor and former church business administrator, Foundation Supply Co. understands the challenges churches face when balancing quality, durability, and budget.")
                            .foregroundStyle(.secondary)

                        NavigationLink {
                            StoryView()
                        } label: {
                            Label(
                                "Read Our Story",
                                systemImage: "arrow.right"
                            )
                            .font(.subheadline.bold())
                            .foregroundStyle(Color.fscAccent)
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.fscSurface)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16)
                    )
                }
                .frame(maxWidth: 650)
                .padding(20)
                .frame(maxWidth: .infinity)
            }
            .background(Color.fscBackground)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// Our Story page
struct StoryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text("Our Story")
                    .font(.largeTitle.bold())

                Text("Foundation Supply Company exists to help churches and nonprofits access high-quality seating at pricing that respects stewardship.")

                Text("Founded by a pastor and former church business administrator, our company was built from real ministry experience and a clear understanding of the challenges churches face when balancing quality, durability, and budget.")

                Text("We intentionally keep our offerings simple, focusing on the chairs most churches need and use every week. Every product we offer is selected for comfort, durability, and value.")

                Text("Our goal is simple: to serve churches with clarity and care, so you can focus on your people and your mission.")
            }
            .foregroundStyle(Color.fscText)
            .padding(20)
        }
        .background(Color.fscBackground)
        .navigationTitle("Our Story")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
