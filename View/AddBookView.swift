//
//  ProfileView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 23/02/2025.
//
import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var controller = BookManagement()
    @State private var newTitle: String = ""
    @State private var newAuthor: String = ""
    @State private var newGenre: String = ""
    @State private var newTotalPages: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $newTitle)
                    TextField("Author", text: $newAuthor)
                    TextField("Genre", text: $newGenre)
                    TextField("Total Pages", text: $newTotalPages)
                }
                
                Section {
                    Button("Add Book") {
                        if let totalPages = Int(newTotalPages) {
                            controller.addItem(title: newTitle, author: newAuthor, genre: newGenre.isEmpty ? nil : newGenre, totalPages: totalPages, to: nil)
                            newTitle = ""
                            newAuthor = ""
                            newGenre = ""
                            newTotalPages = ""
                        }
                    }
                }
            }
            .navigationTitle("Add Book")
        }
        .onAppear {
            controller.setModelContext(modelContext)
        }
    }
}

#Preview {
    AddBookView()
        .modelContainer(for: [Item.self], inMemory: true)
}
