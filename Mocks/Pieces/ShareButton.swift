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
    @State var sheet = false
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                
                let mock = mockStackExport.snapshot()
                items.removeAll()
                items.append(mock)

                sheet.toggle()

            }, label: {
                HStack {
                        Text("Share")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            })
            .sheet(isPresented: $sheet, content: {
                ShareSheet(items: items)
            })
            .padding()
            .padding(.bottom, 16)
        }
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
