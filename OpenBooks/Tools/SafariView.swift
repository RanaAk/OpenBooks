//
//  SafariView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//


import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    
   
    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        var parent: SafariView
        init(_ parent: SafariView) {
            self.parent = parent
        }
        
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
     
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}



#Preview {
    SafariView(url : URL(string: "https://books.google.com/books/content?id=jaICZ5UoiGMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!)
}
