//
//  QuoteView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct QuoteView: View {
    
    var selectedChair: String = "The Foundation Chair"
    
    @State private var chairModel = "The Foundation Chair"
    @State private var quantity = ""
    @State private var churchName = ""
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var submitted = false
    
    let chairOptions = chairData.map { $0.name }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Request a Quote") {
                    Picker("Chair Model", selection: $chairModel) {
                        ForEach(chairOptions, id: \.self) { chair in
                            Text(chair)
                        }
                    }
                    
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.numberPad)
                    
                    TextField("Church or Organization", text: $churchName)
                    TextField("Your Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                Section("Message") {
                    TextField("Tell us what you're looking for", text: $message, axis: .vertical)
                        .lineLimit(4)
                }
                
                Section {
                    Button("Submit Quote Request") {
                        submitted = true
                    }
                    .disabled(quantity.isEmpty || churchName.isEmpty || name.isEmpty || email.isEmpty)
                }
                
                if submitted {
                    Text("Thank you! Foundation Supply Co. will be in touch soon.")
                        .foregroundStyle(.green)
                }
            }
            .navigationTitle("Quote")
            .onAppear {
                chairModel = selectedChair
            }
        }
    }
}
