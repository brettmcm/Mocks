//
//  SettingsSlide.swift
//  Mocks
//
//  Created by Brett McMillin on 4/10/22.
//

import SwiftUI

struct SettingSlide: View {
    
    @StateObject var settings: MockSettings
    
    var slide: String
    var open: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Button(action: {
                settings.activeSlide = slide
                settings.adjusting = true
            }) {
                ViewHeader(settings: settings, viewTitle: slide)
            }
            .if(settings.adjusting) { view in
                view.buttonStyle(StaticButtonStyle())
            }

//            SettingsDisplay(settings: settings, setting: slide)
//                .padding(.top, open ? 8 : 0)
            
            switch slide {
            case "Settings" :
                DeviceSettings(settings: settings)
                    .frame(maxHeight: open ? .infinity : 0)
                    .opacity(open ? 1 : 0)
            case "Light" :
                LightController(settings: settings)
                    .frame(maxHeight: open ? .infinity : 0)
                    .opacity(open ? 1 : 0)
            case "Frame" :
                FrameController(settings: settings)
                    .frame(maxHeight: open ? .infinity : 0)
                    .opacity(open ? 1 : 0)
            default :
                Text("")
            }
        }
        .frame(maxHeight: open ? .infinity : settings.adjusting ? 0 : nil, alignment: .top)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: open ? 16 : 8, style: .continuous))
        .padding(.horizontal, open ? 0 : 16)
        .opacity(open ? 1 : settings.adjusting ? 0 : 1)
        .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.adjusting)
        .environmentObject(settings)

    }
    
}
