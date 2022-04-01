//
//  Modifiers.swift
//  Mocks
//
//  Created by Brett McMillin on 3/17/22.
//

import SwiftUI

struct BackgroundRoundedRect: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(color))
    }
}

extension View {
    func BGRoundedRectStyle(with color: Color) -> some View {
        modifier(BackgroundRoundedRect(color: color))
    }
}

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: 12, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: 12, content: content)
            }
        }
    }
}
