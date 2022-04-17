//
//  ContentView.swift
//  Mocks
//
//  Created by Brett McMillin on 3/6/22.
//

import SwiftUI


struct DebugView: View {
    
    @StateObject var settings: MockSettings
    
    @State var testNumber = 1.0
    @State var open = true
    
    var body: some View {
        ZStack {
            
            VStack {
                List {
                    HStack {
                        Text("Zoom")
                            .frame(width: 75, alignment: .leading)
                        Slider(value: $settings.zoomLevel, in: 1...2, step: 0.01)
                    }
                    .listRowBackground(Color.clear)
                    HStack {
                        Text("Focus")
                            .frame(width: 75, alignment: .leading)
                        Slider(value: $settings.focusLevel, in: -150...150, step: 1)
                    }
                    .listRowBackground(Color.clear)
                    HStack {
                        Text("Presets")
                            .frame(width: 75, alignment: .leading)
                        Button(action: {
                            settings.zoomLevel = 1
                            settings.focusLevel = 0
                        }) {
                            Text("Full")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer()
                        Button(action: {
                            settings.zoomLevel = 2
                            settings.focusLevel = -150
                        }) {
                            Text("Bottom")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Spacer()
                        Button(action: {
                            settings.zoomLevel = 2
                            settings.focusLevel = 150
                        }) {
                            Text("Top")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(PlainListStyle())
                .environment(\.defaultMinListRowHeight, 50)
            }
            .frame(maxHeight: open ? .infinity : settings.adjusting ? 0 : nil, alignment: .top)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: open ? 16 : 8, style: .continuous))
            .padding(.horizontal, open ? 0 : 16)
            .opacity(open ? 1 : settings.adjusting ? 0 : 1)
            .animation(.timingCurve(0.8, 0, 0.2, 1, duration: 0.3), value: settings.adjusting)
            
            MockStack(settings: settings)
                .frame(maxWidth: .infinity)
                .aspectRatio(1.2, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.horizontal)
        }
        .environmentObject(settings)
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView(settings: MockSettings())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}


