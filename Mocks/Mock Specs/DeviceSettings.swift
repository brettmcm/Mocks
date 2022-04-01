//
//  DeviceSettings.swift
//  Mocks
//
//  Created by Brett McMillin on 3/28/22.
//

import SwiftUI

struct DeviceSettings: View {
    
    @Binding public var statusBarVisible: Bool
    @Binding public var homeBarVisible: Bool
    @Binding public var darkMode: Bool

    @Binding public var bgColor: Color
    @Binding public var deviceActive: String
    @Binding public var lightingActive: String
    @Binding public var shadowStrength: Double
    @Binding public var shadowAngle: Double
    @Binding public var framingActive: String
    @Binding public var screenImage: Image?
    
    @State var selectedColor: Color?
    
    var body: some View {
        List {
            
            VStack(alignment: .leading) {
                Text("DEVICE FRAME")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .listRowSeparator(.hidden)
                .padding(.horizontal)
                HStack {
                    VStack(alignment: .leading) {
                        Text("iPhone 12 Pro")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "lock.fill")
                        .foregroundColor(Color.secondary)
                        .opacity(0.35)
                }
                .padding()
                .padding(.vertical, 4)
                .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
                Text("Currently only iPhone 12 Pro is supported")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal)
            }
            .padding(.bottom, 24)
            .listRowSeparator(.hidden)
            
            
            VStack(alignment: .leading) {
                Text("STATUS BAR")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .listRowSeparator(.hidden)
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 21) {
                    Toggle(isOn: $statusBarVisible) {
                        Text("Status bar visibility")
                            .foregroundColor(Color.gray)
                    }
                    Toggle(isOn: $homeBarVisible) {
                        Text("Home indicator visibility")
                            .foregroundColor(Color.gray)
                    }
                    Toggle(isOn: $darkMode) {
                        Text("Dark mode")
                            .foregroundColor(Color.gray)
                    }
                    .disabled(!statusBarVisible && !homeBarVisible)
                }
                .padding()
                .padding(.vertical, 4)
                .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}


struct CheckBox: View {

    @Binding var selectedColor: Color?
    var color: Color

    var body: some View {
        Button(action: { self.selectedColor = self.color }) {
            Image(systemName: self.selectedColor == color ? "checkmark.circle.fill" : "circle.fill")
        }   .accentColor(self.color)
    }
}
