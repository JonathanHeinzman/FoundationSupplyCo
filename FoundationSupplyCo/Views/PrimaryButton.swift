//
//  PrimaryButton.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.fscBrown)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}
