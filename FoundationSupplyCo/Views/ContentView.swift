//
//  ContentView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedTab = 0
    @State private var selectedChair = chairData[0].name
    @State private var chairToOpen: Chair?

    var body: some View {
        TabView(selection: $selectedTab) {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            ChairListView(chairToOpen: $chairToOpen)
                .tabItem {
                    Label("Chairs", systemImage: "chair")
                }
                .tag(1)

            QuoteView(selectedChair: $selectedChair)
                .tabItem {
                    Label("Quote", systemImage: "doc.text")
                }
                .tag(2)

            MoreView()
                .tabItem {
                    Label("More", systemImage: "line.3.horizontal")
                }
                .tag(3)
        }
        .tint(.fscAccent)
        .environment(
            \.requestQuote,
            { chairName in
                selectedChair = chairName
                selectedTab = 2
            }
        )
        .environment(
            \.openChair,
            { chair in
                chairToOpen = chair
                selectedTab = 1
            }
        )
    }
}

// Request Quote navigation
private struct RequestQuoteKey: EnvironmentKey {
    static let defaultValue: (String) -> Void = { _ in }
}

// Open Chair navigation
private struct OpenChairKey: EnvironmentKey {
    static let defaultValue: (Chair) -> Void = { _ in }
}

extension EnvironmentValues {

    var requestQuote: (String) -> Void {
        get { self[RequestQuoteKey.self] }
        set { self[RequestQuoteKey.self] = newValue }
    }

    var openChair: (Chair) -> Void {
        get { self[OpenChairKey.self] }
        set { self[OpenChairKey.self] = newValue }
    }
}

struct MoreView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ResourcesView()
                } label: {
                    Label("Resources", systemImage: "book")
                }

                NavigationLink {
                    ContactView()
                } label: {
                    Label("Contact", systemImage: "envelope")
                }
            }
            .navigationTitle("More")
        }
    }
}

#Preview {
    ContentView()
}
