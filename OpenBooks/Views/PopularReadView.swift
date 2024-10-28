//
//  MostReadView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import SwiftUI

struct PopularReadView : View {
    @Bindable var  ViewModel = BookViewModel()
    
    var body: some View {
        NavigationStack {
            Text("Popular")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(ViewModel.popularBooks, id: \.id) { book in
                        NavigationLink {
                            SelectedView(book: book)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Popular(book: book)
                        }

                        
                    }
                }.task {
                    Task {
                        try await self.ViewModel.getPopularBooks()
                    }
                }
            }
        }
        
    }
}

struct Popular: View {
    var book:Book
    var body: some View {
        if let thumbnailURLString = book.volumeInfo.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://"),
           let thumbnailURL = URL(string: thumbnailURLString) {
            AsyncImage(url: thumbnailURL){ image in
                
                image
                    .resizable()
                    .scaledToFill()
            }placeholder: {
                ProgressView()
            }
                .frame (width: 120, height: 160)
                .clipShape(.rect(cornerRadius: 12))
                .overlay (alignment: .topTrailing) {
                    HStack(spacing:2){
                        Image (systemName: "star.fill").foregroundStyle(.purple)
                        if let rating = Double(book.volumeInfo.maturityRating ?? "") {
                            Text("\(rating, specifier: "%.1f")")
                                .foregroundStyle(.black)
                        } else {
                            Text("N/A")
                                .foregroundStyle(.black)
                        }
                    }
                    .offset (x: -1)
                    .font (.system(size: 8))
                    .frame (width: 35, height: 15)
                    .background(.white,in: .rect(cornerRadius: 20))
                    .padding (6)
                    
                }
        }else {
            
        }
    }
}


#Preview {
    PopularReadView()
}
