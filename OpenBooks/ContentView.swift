////
////  ContentView.swift
////  OpenBooks
////
////  Created by RANA  on 26/10/24.
////
//
import SwiftUI

struct ContentView: View {
    @State private var viewModel = BookViewModel()
   
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
}


