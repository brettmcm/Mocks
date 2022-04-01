//
//  ContentView.swift
//  Mocks
//
//  Created by Brett McMillin on 3/6/22.
//

import SwiftUI

struct MockSpecRow: View {
    
    var label: String
    var value: String
    
    
    @State public var displayLabel = ""
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(Color.gray)
            Text(mapLabels(rawValue: value))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .clipped()
                .font(.headline)
                .foregroundColor(Color.blue)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.secondary)
                .opacity(0.35)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
    }
}

func mapLabels(rawValue: String) -> String {
    switch rawValue {
        case "heavy":
            return "Heavy shadow"
        case "medium":
            return "Medium shadow"
        case "light":
            return "Light shadow"
        case "none":
            return "No shadow"
        case "full":
            return "Full"
        case "top":
            return "Top focus"
        case "bottom":
            return "Bottom focus"
        case "iphone12pro":
            return "iPhone 12 Pro"
        default:
            return rawValue
    }
}
