//
//  BookView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import SwiftUI

struct BookView : View {
    var book : Book
    var body: some View {
        NavigationStack {
            if let thumbnailURLString = book.volumeInfo.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://"),
               let thumbnailURL = URL(string: thumbnailURLString) {
                AsyncImage(url: thumbnailURL) { image in
                    image
                        .resizable()
                        .frame(width: 176, height: 260)
                        .clipShape(.rect(cornerRadius: 12))
                } placeholder: {
                    ProgressView()
                }
                .overlay(alignment: .bottom) {
                    UnevenRoundedRectangle(bottomLeadingRadius: 12, bottomTrailingRadius: 12)
                        .frame(height: 40)
                        .foregroundStyle(LinearGradient(colors: [.black, .clear], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                    Text(book.volumeInfo.title)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 150, alignment: .leading)
                }
                .overlay(alignment: .topTrailing) {
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                            .foregroundStyle(.purple)
                        if let rating = Double(book.volumeInfo.maturityRating ?? "") {
                            Text("\(rating, specifier: "%.1f")")
                                .foregroundStyle(.black)
                        } else {
                            Text("N/A")
                                .foregroundStyle(.black)
                        }
                    }
                    .offset(x : -1)
                    .font(.system(size: 11))
                    .frame(width: 45, height: 22)
                    .background(.white, in : .rect(cornerRadius: 20))
                    .padding(12)
                }
            } else {
                // Placeholder for when there is no thumbnail URL
                VStack {
                    Image(systemName: "book.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .foregroundColor(.red)
                    Text(book.volumeInfo.title)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 150, alignment: .leading)
                }.overlay(alignment: .topTrailing) {
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                            .foregroundStyle(.purple)
                        if let rating = Double(book.volumeInfo.maturityRating ?? "") {
                            Text("\(rating, specifier: "%.1f")")
                                .foregroundStyle(.black)
                        } else {
                            Text("N/A")
                                .foregroundStyle(.black)
                        }
                    }
                    .offset(x : -1)
                    .font(.system(size: 11))
                    .frame(width: 45, height: 22)
                    .background(.white, in : .rect(cornerRadius: 20))
                    .padding(12)
                }
            }
        }
    }
}
