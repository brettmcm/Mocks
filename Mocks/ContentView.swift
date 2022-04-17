//
//  ContentView.swift
//  Mocks
//
//  Created by Brett McMillin on 3/6/22.
//

import SwiftUI

struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct ContentView: View {
    
    @StateObject var settings = MockSettings()
    
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    Image(systemName: "iphone")
                    Text("Mocks")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    Text(settings.appVersion)
                        .font(.caption)
                        .foregroundColor(Color.gray)
                }
                .frame(height: 68)
                .padding(.horizontal)
                .offset(y: settings.adjusting ? -24 : 0)
                .opacity(settings.adjusting ? 0 : 1)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.adjusting)
            }
            .frame(height: settings.screenHeight, alignment: .top)
            
            
            VStack(spacing: settings.adjusting ? 0 : 8) {
                    SettingSlide(settings: settings, slide: "Settings", open: settings.adjusting && settings.activeSlide == "Settings")
                    SettingSlide(settings: settings, slide: "Light", open: settings.adjusting && settings.activeSlide == "Light")
                    SettingSlide(settings: settings, slide: "Frame", open: settings.adjusting && settings.activeSlide == "Frame")
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, settings.adjusting ? 8 : 68 + settings.screenWidth/1.2-20)
            .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.adjusting)
            
            VStack {
                MockStack(settings: settings)
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.2, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.horizontal)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 68)
            .allowsHitTesting(false)
            
            
            ShareButton(settings: settings)
                .offset(y: settings.adjusting ? 116 : 0)
                .padding(.bottom, 32)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.adjusting)
        }
        .padding(.top, 60)
        .edgesIgnoringSafeArea(.bottom)
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(settings: MockSettings())
//            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}


