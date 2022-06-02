//
//  ContentView.swift
//  Mocks
//
//  Created by Brett McMillin on 3/6/22.
//

import SwiftUI

struct DeviceSelect1: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    DeviceOption(name: "iPhone X", dims: "375x812", active: true)
//                        .listRowSeparator(.hidden)
                    DeviceOption(name: "iPhone X", dims: "375x812", active: false)
//                        .listRowSeparator(.hidden)
                    DeviceOption(name: "iPhone X", dims: "375x812", active: false)
//                        .listRowSeparator(.hidden)
                    DeviceOption(name: "iPhone X", dims: "375x812", active: false)
//                        .listRowSeparator(.hidden)
                    DeviceOption(name: "iPhone X", dims: "375x812", active: false)
//                        .listRowSeparator(.hidden)
                    DeviceOption(name: "iPhone X", dims: "375x812", active: false)
//                        .listRowSeparator(.hidden)
                }
                .padding()
            }
            .navigationBarTitle("Devices", displayMode: .large)
            .toolbar {
                ToolbarItem {
                    Button("Done") { self.presentationMode.wrappedValue.dismiss() }
                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}


struct DeviceOption: View {
    
    var name: String
    var dims: String
    var active: Bool
    
    var body: some View {

        Button(action: {
            
        }) {
            HStack(spacing: 0) {
                Image("iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.vertical)
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text(dims)
                        .font(.body)
                        .foregroundColor(Color.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if active {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.blue)
                        .imageScale(.large)
                        .frame(width: 32, height: 32)
                        .clipped()
                        .font(.title3)
                        .padding(.trailing, 28)
                }
            }
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.secondarySystemBackground)), alignment: .center)
        }
    }
    
}

