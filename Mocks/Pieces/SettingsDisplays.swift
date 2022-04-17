//
//  SettingsDisplays.swift
//  Mocks
//
//  Created by Brett McMillin on 4/10/22.
//

import SwiftUI

struct SettingsDisplay: View {
    
    @ObservedObject var settings = MockSettings()
    
    var setting: String
    
    var body: some View {
        HStack(spacing: 16) {
            switch setting {
            case "Light" :
                HStack {
                    Image(systemName: "sun.max")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(String(Int(settings.shadowStrength * 100)) + "%")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .frame(width: 60, alignment: .leading)
                }
                HStack {
                    Image(systemName: "arrow.left.and.right")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(String(Int((settings.shadowAngle/10) * 45)) + "°")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
            case "Frame" :
                HStack {
                    Image(systemName: settings.focusLevel < -100 ? "arrow.down" : settings.focusLevel > 100 ? "arrow.up" : "arrow.up.and.down")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(settings.focusLevel < -100 ? "Bottom" : settings.focusLevel > 100 ? "Top" : "Center")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .frame(width: 60, alignment: .leading)
                }
                HStack {
                    Image(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(String(settings.zoomLevel.truncate(places: 1)) + "x")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
            case "Settings" :
                HStack {
                    Image(systemName: "platter.filled.top.and.arrow.up.iphone")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(settings.statusBarVisible ? "On" : "Off")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                        .frame(width: 60, alignment: .leading)
                }
                HStack {
                    Image(systemName: "circle.lefthalf.filled")
                        .font(.callout)
                        .frame(width: 15)
                    .foregroundColor(Color.gray)
                    Text(settings.darkMode ? "Dark" : "Light")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
            default :
                Text("")
            }
        }
        .padding(.horizontal)
        .environmentObject(settings)
    }
}
