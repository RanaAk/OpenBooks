//
//  CategoryButtonView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import SwiftUI

import SwiftUI

struct CategoryButton: View {
    var category : Tab
    var selected : Bool
    var body: some View {
        Text(category.rawValue)
            .foregroundStyle(selected ? .primary : .secondary)
            .bold()
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(
                selected ? RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.6)) : RoundedRectangle(cornerRadius: 20).fill(Color.clear)
            )
            .frame(height: 70)
            
        
    }
}

#Preview {
    CategoryButton(category: Tab.fiction, selected: true)
}
