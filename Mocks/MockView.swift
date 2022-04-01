import SwiftUI

struct MockView: View {
    
    @State public var statusBarVisible = true
    @State public var homeBarVisible = true
    @State public var darkMode = false
    @State private var deviceSelect = false
    @State private var bgColor = Color.red
    
    @State public var deviceSelectorVisible = false
    @State public var lightSelectorVisible = false
    
    @State public var shadowStrength = 1.0
    @State public var shadowAngle = 0.0
    
    @State public var frameSelectorVisible = false
    
    @State public var deviceActive = "iphone12pro"
    @State public var lightingActive = "heavy"
    @State public var framingActive = "full"
    
    @State public var isShowPhotoLibrary = false
    @State public var screenImage: Image? = Image("")
    
    var mockTitle: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MockDetails(
                statusBarVisible: $statusBarVisible,
                homeBarVisible: $homeBarVisible,
                darkMode: $darkMode,
                bgColor: $bgColor,
                deviceActive: $deviceActive,
                lightingActive: $lightingActive,
                shadowStrength: $shadowStrength,
                shadowAngle: $shadowAngle,
                framingActive: $framingActive,
                isShowPhotoLibrary: $isShowPhotoLibrary,
                screenImage: $screenImage,
                mockTitle: mockTitle
            )
            LightingSelect(
                lightSelectorVisible: $lightSelectorVisible,
                bgColor: $bgColor,
                deviceActive: $deviceActive,
                statusBarVisible: $statusBarVisible,
                homeBarVisible: $homeBarVisible,
                darkMode: $darkMode,
                lightingActive: $lightingActive,
                shadowStrength: $shadowStrength,
                shadowAngle: $shadowAngle,
                framingActive: $framingActive,
                screenImage: $screenImage
            )
            FrameSelect(
                frameSelectorVisible: $frameSelectorVisible,
                bgColor: $bgColor,
                deviceActive: $deviceActive,
                statusBarVisible: $statusBarVisible,
                homeBarVisible: $homeBarVisible,
                darkMode: $darkMode,
                lightingActive: $lightingActive,
                shadowStrength: $shadowStrength,
                shadowAngle: $shadowAngle,
                framingActive: $framingActive,
                screenImage: $screenImage
            )
        }
    }
}


struct MockDetails: View {
    
    @Binding public var statusBarVisible: Bool
    @Binding public var homeBarVisible: Bool

    @Binding public var darkMode: Bool
    @Binding public var bgColor: Color
    
    @Binding public var deviceActive: String
    @Binding public var lightingActive: String
    @Binding public var shadowStrength: Double
    @Binding public var shadowAngle: Double
    @Binding public var framingActive: String
    
    @Binding public var isShowPhotoLibrary: Bool
    @Binding public var screenImage: Image?
    
    var mockTitle: String
    
    @State private var mockSaved = false
    @State private var comingSoon = false
    
    @State var items : [Any] = []
    @State var sheet = false
    
    var body: some View {
                NavigationView(){
                    VStack {
                        
                        
                        
                        MockStack(
                            bgColor: $bgColor,
                            deviceActive: $deviceActive,
                            statusBarVisible: $statusBarVisible,
                            homeBarVisible: $homeBarVisible,
                            darkMode: $darkMode,
                            lightingActive: $lightingActive,
                            shadowStrength: $shadowStrength,
                            shadowAngle: $shadowAngle,
                            framingActive: $framingActive,
                            screenImage: $screenImage
                        )
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.2, contentMode: .fit)
                        .cornerRadius(6)
                        .padding(.horizontal, 12)
                        
                        VStack {
                        
                        
                        // Screen select
                        Button(action: {
                            self.isShowPhotoLibrary = true
                        }) {
                            HStack {
                                Text("Screen")
                                    .foregroundColor(Color.gray)
                                Spacer()
                                if self.screenImage == Image("") {
                                    Text("Add Image")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .clipped()
                                        .font(.headline)
                                        .foregroundColor(Color.blue)
                                } else {
                                    self.screenImage?
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 32, height: 32)
                                        .background(Color(UIColor.tertiarySystemBackground))
                                        .cornerRadius(4)
                                }
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
                        }.sheet(isPresented: $isShowPhotoLibrary) {
                            ImagePicker(image: self.$screenImage)
                        }
                        .padding(.horizontal, 12)
                        
                        
                        
                        // BG color select
                        HStack {
                            ColorPicker("Background", selection: $bgColor, supportsOpacity: false)
                                .foregroundColor(Color.gray)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .BGRoundedRectStyle(with: Color(.secondarySystemBackground))
                        .padding(.horizontal, 12)
                        
                        
                        
                        // Device settings
                            NavigationLink(destination:
                                DeviceSettings(
                                    statusBarVisible: $statusBarVisible,
                                    homeBarVisible: $homeBarVisible,
                                    darkMode: $darkMode,
                                    bgColor: $bgColor,
                                    deviceActive: $deviceActive,
                                    lightingActive: $lightingActive,
                                    shadowStrength: $shadowStrength,
                                    shadowAngle: $shadowAngle,
                                    framingActive: $framingActive,
                                    screenImage: $screenImage
                                )
                                .navigationTitle("Device")
                            ) {
                                MockSpecRow(label: "Device", value: deviceActive)
                            }
                            .padding(.horizontal, 12)
                        
                        
                        
                        // Lighting select
                        NavigationLink(destination:
                            LightingSettings(
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                statusBarVisible: $statusBarVisible,
                                homeBarVisible: $homeBarVisible,
                                darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                shadowStrength: $shadowStrength,
                                shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage
                            )
                            .navigationTitle("Lighting")
                        ) {
                            MockSpecRow(label: "Lighting", value: "Adjust")
                        }
                        .padding(.horizontal, 12)
                        
                        
                        
                        
                        // Framing select
                        NavigationLink(destination:
                            FrameSelect2(
                                bgColor: $bgColor,
                                deviceActive: $deviceActive,
                                statusBarVisible: $statusBarVisible,
                                homeBarVisible: $homeBarVisible,
                                darkMode: $darkMode,
                                lightingActive: $lightingActive,
                                shadowStrength: $shadowStrength,
                                shadowAngle: $shadowAngle,
                                framingActive: $framingActive,
                                screenImage: $screenImage
                            )
                            .navigationTitle("Framing")
                        ) {
                            MockSpecRow(label: "Framing", value: framingActive)
                        }
                        .padding(.horizontal, 12)
                        
                        
                        
                        
                        // Share button
                        Button(action: {
                            let mock = mockStackExport.snapshot()
                            items.removeAll()
                            items.append(mock)
    
                            sheet.toggle()
    
                        }, label: {
                            HStack {
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.headline)
                                    Text("Share")
                                        .font(.headline)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .BGRoundedRectStyle(with: Color.accentColor)
                        })
                        .sheet(isPresented: $sheet, content: {
                            ShareSheet(items: items)
                        })
                        .padding(.horizontal, 12)
                        .padding(.bottom)
                        
                    }
                    .navigationBarHidden(true)
                    
                    
                }
            
        }
    }
        
    
    var mockStackExport: some View {
        MockStack(
            bgColor: $bgColor,
            deviceActive: $deviceActive,
            statusBarVisible: $statusBarVisible,
            homeBarVisible: $homeBarVisible,
            darkMode: $darkMode,
            lightingActive: $lightingActive,
            shadowStrength: $shadowStrength,
            shadowAngle: $shadowAngle,
            framingActive: $framingActive,
            screenImage: $screenImage
        )
        .aspectRatio(1.2, contentMode: .fit)
        .frame(width: 600)
    }
}



extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize

        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }

    }
}

//struct ShareSheet : UIViewControllerRepresentable {
//    var items : [Any]
//    func makeUIViewController(context: Context) -> UIActivityViewController {
//        let controller = UIActivityViewController(activityItems: items, applicationActivities: [])
//        return controller
//    }
//    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
//    }
//}


struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    var servicesToShareItem: [UIActivity]? = nil
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: servicesToShareItem)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ShareSheet>) {}
}
