//
//  MockObject.swift
//  Mocks
//
//  Created by Brett McMillin on 4/10/22.
//

import SwiftUI


class MockSettings: ObservableObject {
    
    @Published var appVersion = "v1.0.6"
    @Published var screenHeight = UIScreen.main.bounds.size.height
    @Published var screenWidth = UIScreen.main.bounds.size.width
    
    @Published var activeSlide = ""
    @Published var adjusting = false
    
    @Published var statusBarVisible = true
    @Published var darkMode = false
    @Published var bgColor = Color.gray
    
    @Published var shadowStrength = 1.0
    @Published var shadowAngle = -10.0
    
    @Published var zoomLevel = 1.0
    @Published var focusLevel = 0.0
    
    @Published var isShowPhotoLibrary = false
    @Published var screenImage: Image? = Image("")
    
    @Published var adjustmentActive = false
    @Published var activeAdjustment = "Mockup"
    
    
}
