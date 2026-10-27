//
//  QuoteView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct QuoteView: View {

    @Binding var selectedChair: String

    @State private var chairModel = ""
    @State private var quantity = ""
    @State private var churchName = ""
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var submitted = false

    private var chairOptions: [String] {
        chairData.map { $0.name }
    }

    private var isFormValid: Bool {
        guard
            let amount = Int(quantity),
            amount > 0,
            !churchName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
            isValidEmail(email)
        else {
            return false
        }

        return true
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Request a Quote")
                            .font(.largeTitle.bold())
                            .foregroundStyle(Color.fscText)

                        Text("Tell us what your organization needs, and we'll help you find the right seating.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }

                    // Chair selection
                    VStack(alignment: .leading, spacing: 12) {
                        sectionTitle("Chair Selection")

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Chair Model")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            Picker("Chair Model", selection: $chairModel) {
                                ForEach(chairOptions, id: \.self) { chair in
                                    Text(chair).tag(chair)
                                }
                            }
                            .tint(Color.fscAccent)
                        }

                        inputField(
                            "Quantity",
                            placeholder: "Number of chairs",
                            text: $quantity,
                            keyboard: .numberPad
                        )
                    }
                    .padding(18)
                    .background(Color.fscSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // Contact information
                    VStack(alignment: .leading, spacing: 16) {
                        sectionTitle("Your Information")

                        inputField(
                            "Church or Organization",
                            placeholder: "Organization name",
                            text: $churchName
                        )

                        inputField(
                            "Your Name",
                            placeholder: "Full name",
                            text: $name
                        )

                        inputField(
                            "Email Address",
                            placeholder: "you@example.com",
                            text: $email,
                            keyboard: .emailAddress
                        )
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    }
                    .padding(18)
                    .background(Color.fscSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // Additional details
                    VStack(alignment: .leading, spacing: 12) {
                        sectionTitle("Additional Details")

                        Text("Tell us about your project, quantity needs, or any questions.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        TextField(
                            "Your message (optional)",
                            text: $message,
                            axis: .vertical
                        )
                        .lineLimit(4...6)
                        .padding(12)
                        .background(Color.fscBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(18)
                    .background(Color.fscSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                    // Submit
                    Button {
                        submitted = true
                    } label: {
                        Text("Submit Quote Request")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(
                                isFormValid
                                    ? Color.fscBrown
                                    : Color.gray
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .disabled(!isFormValid)

                    if submitted {
                        Text("Thank you! Your form is ready, but it hasn't been sent to Foundation Supply Co. yet.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.fscSurface)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .frame(maxWidth: 600)
                .padding(20)
                .frame(maxWidth: .infinity)
            }
            .background(Color.fscBackground)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Quote")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if chairOptions.contains(selectedChair) {
                    chairModel = selectedChair
                } else if chairModel.isEmpty {
                    chairModel = chairOptions.first ?? ""
                }
            }
            .onChange(of: selectedChair) { _, newChair in
                if chairOptions.contains(newChair) {
                    chairModel = newChair
                    submitted = false
                }
            }
        }
    }

    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.title3.bold())
            .foregroundStyle(Color.fscText)
    }

    private func inputField(
        _ title: String,
        placeholder: String,
        text: Binding<String>,
        keyboard: UIKeyboardType = .default
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            TextField(placeholder, text: text)
                .keyboardType(keyboard)
                .padding(12)
                .background(Color.fscBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let parts = email.split(separator: "@")
        guard parts.count == 2 else { return false }
        return parts[1].contains(".") && !email.contains(" ")
    }
}

#Preview {
    QuoteView(selectedChair: .constant("The Foundation Chair"))
}
