//
//  ContentView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ChairListView()
                .tabItem {
                    Label("Shop", systemImage: "chair")
                }
            
            QuoteView()
                .tabItem {
                    Label("Quote", systemImage: "doc.text")
                }
            
            ResourcesView()
                .tabItem {
                    Label("Resources", systemImage: "book")
                }
            
            ContactView()
                .tabItem {
                    Label("Contact", systemImage: "envelope")
                }
            
            ChairARView(modelName: "Chair3DModel", realHeight: .init(value: 34, unit: .inches))
                .tabItem {
                    Label("AR", systemImage: "sunglasses")
                }
            
        }
        .tint(.fscBrown)
    }
}

#Preview {
    ContentView()
}
