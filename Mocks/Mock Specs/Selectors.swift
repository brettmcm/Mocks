//
//  Selectors.swift
//  Mocks
//
//  Created by Brett McMillin on 3/12/22.
//

import SwiftUI

struct LightingSelect: View {
    
    @Binding public var lightSelectorVisible: Bool
    
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
        ZStack(alignment: .bottom) {
            VStack(spacing: 0){
                HStack(){
                    Image(systemName: "lightbulb")
                        .font(.title2)
                        .foregroundColor(Color.secondary)
                    Text("Lighting")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: { lightSelectorVisible.toggle() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.systemFill))
                            .font(.title)
                    }
                }
                .padding()
//                Text("Select a lighting option to get a super sweet shadow.")
//                    .foregroundColor(Color.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: { lightingActive = "heavy" }) {
                            SceneOption(image: "shadow-heavy", title: "Heavy shadow", selected: $lightingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "shadow",
                                        proposedValue: "heavy"
                            )
                        }
                        Button(action: { lightingActive = "medium" }) {
                            SceneOption(image: "shadow-medium", title: "Medium shadow", selected: $lightingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "shadow",
                                        proposedValue: "medium")
                        }
                        Button(action: { lightingActive = "light" }) {
                            SceneOption(image: "shadow-light", title: "Light shadow", selected: $lightingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "shadow",
                                        proposedValue: "light")
                        }
                        Button(action: { lightingActive = "none" }) {
                            SceneOption(image: "shadow-none", title: "No shadow", selected: $lightingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "shadow",
                                        proposedValue: "none")
                        }
                    }
                    .padding()
                }
                .padding(.bottom, 40)
            }
            .frame(height: lightSelectorVisible ? nil : 0, alignment: .top)
            .background(.regularMaterial)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            .offset(y: 24)
            .animation(.default, value: lightSelectorVisible)
        }
    }
}











struct LightingSelect2: View {

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
        ScrollView {
            VStack(alignment: .leading) {
                Button(action: { lightingActive = "heavy" }) {
                    SceneOption2(image: "shadow-heavy", title: "Heavy shadow", selected: $lightingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "shadow",
                                proposedValue: "heavy"
                    )
                }
                Button(action: { lightingActive = "medium" }) {
                    SceneOption2(image: "shadow-medium", title: "Medium shadow", selected: $lightingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "shadow",
                                proposedValue: "medium")
                }
                Button(action: { lightingActive = "light" }) {
                    SceneOption2(image: "shadow-light", title: "Light shadow", selected: $lightingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "shadow",
                                proposedValue: "light")
                }
                Button(action: { lightingActive = "none" }) {
                    SceneOption2(image: "shadow-none", title: "No shadow", selected: $lightingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "shadow",
                                proposedValue: "none")
                }
            }
            .padding()
        }
    }
}








struct FrameSelect: View {
    
    @Binding public var frameSelectorVisible: Bool
    
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
        ZStack(alignment: .bottom) {
            VStack(spacing: 0){
                HStack(){
                    Image(systemName: "camera.metering.center.weighted.average")
                        .font(.title2)
                        .foregroundColor(Color.secondary)
                    Text("Framing")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: { frameSelectorVisible.toggle() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.systemFill))
                            .font(.title)
                    }
                }
                .padding()
//                Text("Pick your framing to visually focus on the right radness.")
//                    .foregroundColor(Color.gray)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: { framingActive = "full" }) {
                            SceneOption(image: "Full", title: "Full", selected: $framingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "framing",
                                        proposedValue: "full")
                        }
                        Button(action: { framingActive = "top" }) {
                            SceneOption(image: "Top focus", title: "Top focus", selected: $framingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "framing",
                                        proposedValue: "top")
                        }
                        Button(action: { framingActive = "bottom" }) {
                            SceneOption(image: "Bottom focus", title: "Bottom focus", selected: $framingActive,
                                        bgColor: $bgColor,
                                        deviceActive: $deviceActive,
                                        statusBarVisible: $statusBarVisible,
                                        homeBarVisible: $homeBarVisible,
                                        darkMode: $darkMode,
                                        lightingActive: $lightingActive,
                                        shadowStrength: $shadowStrength,
                                        shadowAngle: $shadowAngle,
                                        framingActive: $framingActive,
                                        screenImage: $screenImage,
                                        targetProp: "framing",
                                        proposedValue: "bottom")
                        }
                    }
                    .padding()
                }
                .padding(.bottom, 40)
            }
            .frame(height: frameSelectorVisible ? nil : 0, alignment: .top)
            .background(.regularMaterial)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            .offset(y: 24)
            .animation(.default, value: frameSelectorVisible)
        }
    }
}







struct FrameSelect2: View {
    
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
        ScrollView {
            VStack(alignment: .leading) {
                Button(action: { framingActive = "full" }) {
                    SceneOption2(image: "Full", title: "Full", selected: $framingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "framing",
                                proposedValue: "full")
                }
                Button(action: { framingActive = "bottom" }) {
                    SceneOption2(image: "Bottom focus", title: "Bottom focus", selected: $framingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "framing",
                                proposedValue: "bottom")
                }
                Button(action: { framingActive = "top" }) {
                    SceneOption2(image: "Top focus", title: "Top focus", selected: $framingActive,
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                 statusBarVisible: $statusBarVisible,
                                 homeBarVisible: $homeBarVisible,
                                 darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                 shadowStrength: $shadowStrength,
                                 shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage,
                                targetProp: "framing",
                                proposedValue: "top")
                }
            }
            .padding()
        }
    }
}






struct SceneOption: View {
    
    var image: String
    var title: String
    
    @Binding public var selected: String
    
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
    
    var targetProp: String
    @State public var proposedValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                MockStack(
                    bgColor: $bgColor,
                    deviceActive: targetProp == "device" ? $proposedValue : $deviceActive,
                    statusBarVisible: $statusBarVisible,
                    homeBarVisible: $homeBarVisible,
                    darkMode: $darkMode,
                    lightingActive: targetProp == "shadow" ? $proposedValue : $lightingActive,
                    shadowStrength: $shadowStrength,
                    shadowAngle: $shadowAngle,
                    framingActive: targetProp == "framing" ? $proposedValue : $framingActive,
                    screenImage: $screenImage
                )
                    .frame(width: 250.0, height: 210)
                    .cornerRadius(6)
                    .saturation(selected == proposedValue ? 1 : 0)
                    .animation(.default, value: selected)
            }
            if title != "" {
                Text(title)
                    .font(.body)
                    .fontWeight(selected == proposedValue ? .bold : .medium)
                    .foregroundColor(Color(UIColor.label))
            }
        }
    }
}



private extension SceneOption2 {
    
    func isDarkBackground(color: Color) -> Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        UIColor(color).getRed(&r, green: &g, blue: &b, alpha: &a)
        let luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  luminance < 0.50

    }
}

struct SceneOption2: View {
    
    var image: String
    var title: String
    
    @Binding public var selected: String
    
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
    
    var targetProp: String
    @State public var proposedValue: String
    
    var body: some View {
        HStack() {
            ZStack(alignment: .topTrailing) {
                MockStack(
                    bgColor: $bgColor,
                    deviceActive: targetProp == "device" ? $proposedValue : $deviceActive,
                    statusBarVisible: $statusBarVisible,
                    homeBarVisible: $homeBarVisible,
                    darkMode: $darkMode,
                    lightingActive: targetProp == "shadow" ? $proposedValue : $lightingActive,
                    shadowStrength: $shadowStrength,
                    shadowAngle: $shadowAngle,
                    framingActive: targetProp == "framing" ? $proposedValue : $framingActive,
                    screenImage: $screenImage
                )
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.2, contentMode: .fit)
                    .cornerRadius(4)
//                    .saturation(selected == proposedValue ? 1 : 0.4)
                    .animation(.default, value: selected)
                Image(systemName: selected == proposedValue ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isDarkBackground(color: bgColor) ? .white : .black)
                    .font(.title2)
                    .padding()
                
            }
//            if title != "" {
//                Text(title)
//                    .font(.body)
//                    .fontWeight(selected == proposedValue ? .bold : .medium)
//                    .foregroundColor(Color(UIColor.label))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
        }
    }
}







func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
 
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
