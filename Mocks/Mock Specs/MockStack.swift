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
    @Binding public var darkMode: Bool
    @Binding public var lightingActive: String
    @Binding public var framingActive: String
    @Binding public var screenImage: Image?
    
    var body: some View {
        
        let deviceLayer = deviceActive + "-" + framingActive
        let shadowLayer = deviceLayer + "-" + lightingActive
        let uiMode = darkMode ? "dark" : "light"
        let statusLayer = deviceLayer + "-status-" + uiMode
        
        GeometryReader { gp in
            ZStack {
                Rectangle()
                    .fill(bgColor)
                    .aspectRatio(1.2, contentMode: .fit)
                if !shadowLayer.contains("none") {
                    Image(shadowLayer)
                        .resizable()
                        .aspectRatio(1.2, contentMode: .fit)
                }
                if self.screenImage == Image("") {
                    Rectangle()
                        .foregroundColor(.gray)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: gp.size.width * 0.307, height: gp.size.height * 0.797)
                        .cornerRadius( gp.size.width * 0.04)
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
