//
//  SelectedView.swift
//  OpenBooks
//
//  Created by RANA  on 27/10/24.
//

import SwiftUI


struct SelectedView: View {
    var book : Book
    @State private var loadSafariView : Bool = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                if let thumbnailImage =  book.volumeInfo.imageLinks?.thumbnail?.replacingOccurrences(of: "http://", with: "https://"),
                   let thumbnail = URL(string: thumbnailImage){
                    AsyncImage(url: thumbnail){ image in
                        
                        image
                            .resizable()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    }placeholder: {
                        ProgressView()
                    }
                    
                }
                
                
                VStack(alignment: .leading, spacing: 24){
                    Text(book.volumeInfo.title)
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    
                    HStack{
                        Text("By " + (book.volumeInfo.authors?.first ?? "RANA"))
                        line()
                        Text(book.volumeInfo.publishedDate ?? "Publish Jul w 20102")
                    }
                    .foregroundStyle(.secondary)
                    
                    HStack{
                        vstackInfo(title: "READS", ammount: "2.4M")
                        Spacer()
                        line()
                        Spacer()
                        vstackInfo(title: "LIKES", ammount: "14.3k")
                        Spacer()
                        line()
                        Spacer()
                        vstackInfo(title: "PAGES", ammount: "60")
                    }
                    
                    Text(book.volumeInfo.description ?? "")
                        .foregroundStyle(.secondary)
                        .lineLimit(20)
                }
                
                .padding()
                .padding(.vertical, 20)
                .padding(.bottom, 60)
                .background(.ultraThinMaterial)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .overlay(alignment: .bottom) {
                    if let previewLink = book.volumeInfo.previewLink?.replacingOccurrences(of: "http://", with: "https://"),
                       let url = URL(string: previewLink) {
                        Button(action: {
                            
                            loadSafariView.toggle()
                            
                        }) {
                            Text("Start Reading")
                                .bold()
                                .padding()
                                .background(.white, in: .capsule)
                                .foregroundStyle(.black)
                        }
                        .padding(.bottom, 25)
                        .fullScreenCover(isPresented: $loadSafariView) {
                            SafariView(url: url)
                                .ignoresSafeArea(.all)
                        }
                        
                    }
                }
 
            }
            .overlay(alignment: .topLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .imageScale(.medium)
                        .padding()
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.black.secondary))
                })
                .offset(y: 60)
            }
            
        
        }.ignoresSafeArea()
    }
}

struct vstackInfo  : View {
    var title : String
    var ammount : String
    var body: some View {
        VStack(alignment : .leading, spacing: 15){
            Text(title)
                .foregroundStyle(.secondary)
            Text(ammount)
                .bold()
        }
    }
}

struct line : View {
    var body: some View {
         Rectangle()
            .frame(width: 1 , height: 35)
    }
}
