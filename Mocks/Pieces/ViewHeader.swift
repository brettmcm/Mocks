//
//  ViewHeader.swift
//  Mocks
//
//  Created by Brett McMillin on 4/10/22.
//

import SwiftUI

struct ViewHeader: View {
    
    @StateObject var settings: MockSettings
    
    var viewTitle: String
    
    var body: some View {

            HStack {
                    Text(viewTitle)
                        .fontWeight(.bold)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                    Button(action: {
                        if !settings.adjusting {
                            settings.activeSlide = viewTitle
                            settings.adjusting = true
                        } else {
                            settings.adjusting = false
                        }
                    }) {
                        if settings.adjusting {
                            Text("Done")
                                .font(.headline)
                        } else {
                            Text("Edit")
                                .font(.headline)
                        }
                    }
            }
            .frame(height: 60)
            .padding(.horizontal)
            .padding(.bottom, settings.adjusting ? (settings.screenWidth/1.2)-32 : 0)
            .environmentObject(settings)
        
    }
}
