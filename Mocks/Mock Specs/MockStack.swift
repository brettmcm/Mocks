//
//  MockStack.swift
//  Mocks
//
//  Created by Brett McMillin on 3/12/22.
//

import SwiftUI


struct MockStack: View {
    
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
        
        let deviceLayer = deviceActive + "-" + framingActive
//        let shadowLayer = deviceLayer + "-" + lightingActive
        let uiMode = darkMode ? "dark" : "light"
        let statusLayer = deviceLayer + "-status-" + uiMode
        let homeLayer = deviceLayer + "-home-" + uiMode
        
        GeometryReader { gp in
            ZStack {
                Rectangle()
                    .fill(bgColor)
                    .aspectRatio(1.2, contentMode: .fit)
//                if !shadowLayer.contains("none") {
//                    Image(shadowLayer)
//                        .resizable()
//                        .aspectRatio(1.2, contentMode: .fit)
//                }
                if self.screenImage == Image("") {
                    Rectangle()
                        .foregroundColor(.gray)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                        .cornerRadius( gp.size.width * 0.04)
                        .dropShadowStyle(strength: shadowStrength, angle: shadowAngle)
                        .if( framingActive == "top" ) { view in
                            view
                                .scaleEffect(2.015)
                                .offset(y: gp.size.height * 0.5)
                        }
                        .if( framingActive == "bottom" ) { view in
                            view
                                .scaleEffect(2.015)
                                .offset(y: gp.size.height * -0.561)
                        }
                } else {
                    self.screenImage?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                        .cornerRadius( gp.size.width * 0.04)
                        .dropShadowStyle(strength: shadowStrength, angle: shadowAngle)
                        .if( framingActive == "top" ) { view in
                            view
                                .scaleEffect(2.015)
                                .offset(y: gp.size.height * 0.5)
                        }
                        .if( framingActive == "bottom" ) { view in
                            view
                                .scaleEffect(2.015)
                                .offset(y: gp.size.height * -0.561)
                        }
                }
                Image(deviceLayer)
                    .resizable()
                    .aspectRatio(1.2, contentMode: .fit)
                if !statusLayer.contains("bottom") && statusBarVisible {
                    Image(statusLayer)
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                }
                if !homeLayer.contains("top") && homeBarVisible {
                    Image(homeLayer)
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                }
            }
            .aspectRatio(1.2, contentMode: .fit)
            .clipped()
        }
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
