//
//  ContentView.swift
//  Mocks
//
//  Created by Brett McMillin on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MockView(mockTitle: "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
            .previewDisplayName("iPad Pro (9.7-inch)")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro Max")
//        ContentView()890
    }
}


