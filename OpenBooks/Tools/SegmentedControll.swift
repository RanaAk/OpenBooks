//
//  SegmentedControll.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import Foundation
import SwiftUI

struct SegmentedControl: View {
    @Binding var selectedTab: Tab
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHStack{
                ForEach(Tab.allCases, id: \.self){ t in
                    CategoryButton(category: t, selected: t == selectedTab)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.4)) {
                                selectedTab = t
                            }
                        }
                }
            }
        }
        
    }
}
