//
//  BooksView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//
import SwiftUI

struct BooksView: View {
    @Binding var selectedTab: Tab
    @State var viewModel = BookViewModel()
    
    var currentBooks: [Book] {
        viewModel.books
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
            ForEach(currentBooks, id: \.id) { book in
                NavigationLink {
                    SelectedView(book: book)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    BookView(book: book)
                }
            }
        }
        .task(id: selectedTab) { 
            do {
                try await viewModel.getBooks(for: selectedTab)
            } catch {
                print("Error loading books: \(error)")
            }
        }
    }
}
