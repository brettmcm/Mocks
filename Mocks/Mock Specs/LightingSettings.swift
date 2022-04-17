//
//  LightingSettings.swift
//  Mocks
//
//  Created by Brett McMillin on 3/31/22.
//

import SwiftUI


struct LightController: View {
    
    @StateObject var settings: MockSettings
    
    @State var dragged = CGSize.zero
    @State var accumulated = CGSize.zero
    
    
    var body: some View {
            ZStack{
                GeometryReader { geometry in
                    Image(systemName: "circle.fill")
                        .font(.system(size: 60))
                        .offset(x: -30, y: -30)
                        .foregroundColor(.primary)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .offset(x: dragged.width + 30, y: dragged.height + 30)
                        .gesture(DragGesture()
                            .onChanged{ value in
                                self.dragged = CGSize(
                                    width: min(max(value.translation.width + self.accumulated.width, 0), geometry.size.width-70),
                                    height: min(max(value.translation.height + self.accumulated.height, 0), geometry.size.height-70)
                                    )
                                settings.shadowAngle = 20 * (self.dragged.width - (geometry.size.width/2))/geometry.size.width
                                settings.shadowStrength = (geometry.size.height  - self.dragged.height/0.82)/geometry.size.height
                            }
                            .onEnded{ value in
                                self.dragged = CGSize(
                                    width: min(max(value.translation.width + self.accumulated.width, 0), geometry.size.width-70),
                                    height: min(max(value.translation.height + self.accumulated.height, 0), geometry.size.height-70)
                                    )
                                self.accumulated = self.dragged
                            }
                         )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height - ((UIScreen.main.bounds.size.width * 1.2) - 28))
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 38, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 38, style: .continuous)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                    )
            .padding(16)
            .padding(.bottom, 56)
            .environmentObject(settings)
    }
    
}




