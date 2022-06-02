//
//  MockStack.swift
//  Mocks
//
//  Created by Brett McMillin on 3/12/22.
//

import SwiftUI


struct MockStack: View {
    
    @StateObject var settings: MockSettings = MockSettings()

    var body: some View {
        
        let uiMode = settings.darkMode ? "dark" : "light"
        let statusLayer = "iphone12pro-full-status-" + uiMode
        let homeLayer = "iphone12pro-full-home-" + uiMode
        
        GeometryReader { gp in
            ZStack {
                Rectangle()
                    .fill(settings.bgColor)
                    .aspectRatio(1.2, contentMode: .fit)
                ZStack {
                    if settings.screenImage == Image("") {
                        Rectangle()
                            .foregroundColor(.gray)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.8)
                            .cornerRadius( gp.size.width * 0.04)
                    } else {
                        settings.screenImage?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.8)
                            .cornerRadius( gp.size.width * 0.04)
                    }
                    Image("iphone12pro-full")
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                    Image(statusLayer)
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                        .opacity(settings.statusBarVisible ? 1 : 0)
                        .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.statusBarVisible)
                    Image(homeLayer)
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                        .opacity(settings.statusBarVisible ? 1 : 0)
                        .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.statusBarVisible)
                }
                .scaleEffect(settings.zoomLevel.truncate(places: 1))
                .offset(y: (gp.size.height/1.75) * settings.focusLevel.truncate(places: 1))
                .clipped()
                .dropShadowStyle(strength: settings.shadowStrength, angle: settings.shadowAngle)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.2), value: settings.zoomLevel)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.2), value: settings.focusLevel)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.2), value: settings.shadowStrength)
                .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.2), value: settings.shadowAngle)
            }
            .aspectRatio(1.2, contentMode: .fit)
        }
        .environmentObject(settings)
    }
    
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


struct DropShadow: ViewModifier {
    
    var baseValue: Double
    var directionAngle: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.75 * Double(baseValue)), radius: CGFloat(1 * baseValue), x: 0, y: CGFloat(3 * baseValue))
            .shadow(color: .black.opacity(0.5 * Double(baseValue)), radius: CGFloat(1 * baseValue), x: CGFloat(-directionAngle * 0.1), y: CGFloat(2 * baseValue))
            .shadow(color: .black.opacity(0.4 * Double(baseValue)), radius: CGFloat(2 * baseValue), x: CGFloat(-directionAngle * 0.4), y: CGFloat(3 * baseValue))
            .shadow(color: .black.opacity(0.3 * Double(baseValue)), radius: CGFloat(5 * baseValue), x: CGFloat(-directionAngle * 0.7), y: CGFloat(7 * baseValue))
            .shadow(color: .black.opacity(0.25 * Double(baseValue)), radius: CGFloat(7 * baseValue), x: CGFloat(-directionAngle), y: CGFloat(7 * baseValue))
            .shadow(color: .black.opacity(0.25 * Double(baseValue)), radius: CGFloat(7 * baseValue), x: CGFloat(-directionAngle * 1.2), y: CGFloat(10 * baseValue))
            .shadow(color: .black.opacity(0.25 * Double(baseValue)), radius: CGFloat(7 * baseValue), x: CGFloat(-directionAngle * 1.5), y: CGFloat(10 * baseValue))
            .shadow(color: .black.opacity(0.15 * Double(baseValue)), radius: CGFloat(10 * baseValue), x: CGFloat(-directionAngle * 1.8), y: CGFloat(15 * baseValue))
            .shadow(color: .black.opacity(0.15 * Double(baseValue)), radius: CGFloat(25 * baseValue), x: CGFloat(-directionAngle * 2), y: CGFloat(15 * baseValue))
            .shadow(color: .black.opacity(0.1 * Double(baseValue)), radius: CGFloat(25 * baseValue), x: CGFloat(-directionAngle * 2.5), y: CGFloat(55 * baseValue))
            .shadow(color: .black.opacity(0.1 * Double(baseValue)), radius: CGFloat(25 * baseValue), x: CGFloat(-directionAngle * 5), y: CGFloat(75 * baseValue))
    }
}

extension View {
    func dropShadowStyle(strength baseValue: Double, angle directionAngle: Double) -> some View {
        modifier(DropShadow(baseValue: baseValue, directionAngle: directionAngle))
    }
}

