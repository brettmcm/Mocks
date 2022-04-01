//
//  LightingSettings.swift
//  Mocks
//
//  Created by Brett McMillin on 3/31/22.
//

import SwiftUI


struct LightingSettings: View {
    
    
    @Binding public var bgColor: Color
    @Binding public var deviceActive: String
    @Binding public var statusBarVisible: Bool
    @Binding public var homeBarVisible: Bool
    @Binding public var darkMode: Bool
    @Binding public var lightingActive: String
    @Binding public var shadowStrength: Double
    @Binding public var shadowAngle: Double
    @Binding public var framingActive: String
    @Binding public var screenImage: Image?
    
    
    
    var body: some View {
        
        List {
            
            MockStack(
                bgColor: $bgColor,
                deviceActive: $deviceActive,
                statusBarVisible: $statusBarVisible,
                homeBarVisible: $homeBarVisible,
                darkMode: $darkMode,
                lightingActive: $lightingActive,
                shadowStrength: $shadowStrength,
                shadowAngle: $shadowAngle,
                framingActive: $framingActive,
                screenImage: $screenImage
            )
            .frame(maxWidth: .infinity)
            .aspectRatio(1.2, contentMode: .fit)
            .cornerRadius(6)
            .listRowSeparator(.hidden)
            
            VStack(alignment: .leading) {
                VStack {
                    HStack(spacing: 0) {
                        Text("Strength")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, alignment: .leading)
                        Slider(value: $shadowStrength, in: 0...1, step: 0.01)
                    }
                    
                    HStack(spacing: 0) {
                        Text("Angle")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, alignment: .leading)
                        Slider(value: $shadowAngle, in: -2...2, step: 0.1)
                    }
                }
                .padding()
                .padding(.vertical, 4)
                .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
            }
            .padding(.bottom, 24)
            .listRowSeparator(.hidden)
            
            
            
            
            
        }
        .listStyle(.plain)
        
    }
}

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
