//
//  DeviceSettings.swift
//  Mocks
//
//  Created by Brett McMillin on 3/28/22.
//

import SwiftUI

struct DeviceSettings: View {
    
    @StateObject var settings: MockSettings
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
                    HStack {
                        Text("Device")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("iPhone 12 Pro")
                            .foregroundColor(Color.gray)
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.secondary)
                            .opacity(0.35)
                    }
                    .listRowBackground(Color.clear)
                    
                    Button(action: {
                        settings.isShowPhotoLibrary = true
                    }) {
                        HStack {
                            Text("Screen")
                            Spacer()
                            if settings.screenImage == Image("") {
                                Text("Add Image")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .clipped()
                                    .font(.headline)
                                    .foregroundColor(Color.blue)
                            } else {
                                settings.screenImage?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 28, height: 28)
                                    .background(Color(UIColor.tertiarySystemBackground))
                                    .cornerRadius(4)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }.sheet(isPresented: $settings.isShowPhotoLibrary) {
                        ImagePicker(image: $settings.screenImage)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(Color.clear)
            
                    ColorPicker("Background", selection: $settings.bgColor, supportsOpacity: false)
                        .listRowBackground(Color.clear)
                    
                    Toggle(isOn: $settings.statusBarVisible) {
                        Text("Accessories")
                    }
                    .listRowBackground(Color.clear)
            
                    Toggle(isOn: $settings.darkMode) {
                        Text("Dark mode")
                    }
                    .disabled(!settings.statusBarVisible)
                    .listRowBackground(Color.clear)
                }
                .padding(.vertical)
                .listStyle(PlainListStyle())
                .environment(\.defaultMinListRowHeight, 50)
                .environmentObject(settings)
            }

}


struct CheckBox: View {

    @Binding var selectedColor: Color?
    var color: Color

    var body: some View {
        Button(action: { self.selectedColor = self.color }) {
            Image(systemName: self.selectedColor == color ? "checkmark.circle.fill" : "circle.fill")
        }   .accentColor(self.color)
    }
}
