//
//  ShareButton.swift
//  Mocks
//
//  Created by Brett McMillin on 4/10/22.
//

import SwiftUI


struct ShareButton: View {
        
    @StateObject var settings = MockSettings()
    
    @State var items : [Any] = []
//    @State var sheet = false
    
    @State private var screenshotShare = UIImage(named: "bird")
    
    class SheetMananger: ObservableObject{
        
        @Published var sheet = false
    }
    
    @StateObject var sheetManager = SheetMananger()
    
    var body: some View {
        Button(action: {
            
            let mock = mockStackExport.snapshot()
            items.removeAll()
            items.append(mock)

            sheetManager.sheet.toggle()

        }, label: {
            Text("Share")
                .font(.headline)
//                HStack {
//                        Text("Share")
//                            .font(.headline)
//                        Image(systemName: "arrow.right")
//                            .font(.headline)
//                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        })
        .sheet(isPresented: $sheetManager.sheet, content: {
            ShareSheet(items: items)
        })
    }
    
    var mockStackExport: some View {
        MockStack(settings: settings)
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
