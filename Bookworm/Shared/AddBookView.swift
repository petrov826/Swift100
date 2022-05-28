//
//  AddBookView.swift
//  Bookworm
//
//  Created by peterpetrov on 2022/05/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3
    
    let genres = [
        "Fantasy", "Horror", "Kids", "Mystery",
        "Poetry", "Romance", "Triller"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's nane", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Book info")
                }
                
                Section {
                    TextEditor(text: $review)
                    // Picker("Rating", selection: $rating) {
                    //     ForEach(0..<6) {
                    //         Text(String($0))
                    //     }
                    // }
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        // add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
