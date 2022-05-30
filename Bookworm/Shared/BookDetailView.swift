//
//  BookDetailView.swift
//  Bookworm
//
//  Created by peterpetrov on 2022/05/28.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding()
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset()
            }
            Text("Written by \(book.author ?? "Unknown Author")")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            HStack {
                Spacer()
                Text(book.date?.formatted(date: .abbreviated, time: .omitted) ?? "Long ago")
                    .font(.subheadline)
            }
            .padding([.trailing, .bottom])
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            
        }
        .navigationTitle(book.title ?? "Unknown Title")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { } // empty closure because no action needed
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        try? moc.save()
        
        dismiss() // go back to source view automatically
    }
}

//struct BookDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetailView()
//    }
//}
