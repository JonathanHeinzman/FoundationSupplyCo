//
//  WordmarkView.swift
//  FoundationSupplyCo
//
//  Created by Jonathan Heinzman on 7/8/26.
//

import SwiftUI

struct WordmarkView: View {
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fscBrown)
                    .frame(width: 42, height: 42)
                
                Text("F")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Foundation")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.fscDark)
                
                Text("SUPPLY CO.")
                    .font(.system(size: 11, weight: .semibold))
                    .tracking(2.2)
                    .foregroundStyle(Color.fscBrown)
            }
        }
    }
}
