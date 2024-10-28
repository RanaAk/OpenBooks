//
//  HomeView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab : Tab  = .all
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                LazyVStack{
                    PopularReadView()
                    SegmentedControl(selectedTab: $selectedTab)
                    BooksView(selectedTab: $selectedTab)
                }
               
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
