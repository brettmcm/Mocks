//
//  LightingSettings.swift
//  Mocks
//
//  Created by Brett McMillin on 3/31/22.
//

import SwiftUI

struct FrameController: View {
    
    @StateObject var settings: MockSettings
    
    var body: some View {
        List {
            HStack {
                Text("Zoom")
                    .frame(width: 75, alignment: .leading)
                Slider(value: $settings.zoomLevel, in: 1...2, step: 0.01)
            }
            .listRowBackground(Color.clear)

            HStack {
                Text("Focus")
                    .frame(width: 75, alignment: .leading)
                Slider(value: $settings.focusLevel, in: -1...1, step: 0.01)
            }
            .listRowBackground(Color.clear)
            
            HStack {
                Text("Presets")
                    .frame(width: 75, alignment: .leading)
                HStack {
                    Button(action: {
                        settings.zoomLevel = 1
                        settings.focusLevel = 0
                    }) {
                            GeometryReader { gp in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .foregroundColor(Color.primary.opacity(0.1))
                                    Rectangle()
                                        .foregroundColor(Color.clear)
                                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                                        .cornerRadius( gp.size.width * 0.04)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.primary, lineWidth: 1)
                                        )
                                }
                                .clipped()
                            }
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1.2, contentMode: .fill)
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {
                        settings.zoomLevel = 2
                        settings.focusLevel = 1
                    }) {
                            GeometryReader { gp in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .foregroundColor(Color.primary.opacity(0.1))
                                    Rectangle()
                                        .foregroundColor(Color.clear)
                                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                                        .cornerRadius( gp.size.width * 0.04)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: gp.size.width * 0.04)
                                                .stroke(Color.primary, lineWidth: 0.5)
                                        )
                                        .scaleEffect(2)
                                        .offset(y: gp.size.height * 0.5)
                                }
                                .clipped()
                            }
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1.2, contentMode: .fill)
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {
                        settings.zoomLevel = 2
                        settings.focusLevel = -1
                    }) {
                            GeometryReader { gp in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .foregroundColor(Color.primary.opacity(0.1))
                                    Rectangle()
                                        .foregroundColor(Color.clear)
                                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                                        .cornerRadius( gp.size.width * 0.04)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: gp.size.width * 0.04)
                                                .stroke(Color.primary, lineWidth: 0.5)
                                        )
                                        .scaleEffect(2)
                                        .offset(y: gp.size.height * -0.5)
                                }
                                .clipped()
                            }
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1.2, contentMode: .fill)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical, 8)
            }
            .listRowBackground(Color.clear)
        }
        .padding(.vertical)
        .listStyle(PlainListStyle())
        .environment(\.defaultMinListRowHeight, 50)
    }
    
}


