//
//  BookDetailView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 19/02/2025.
//
import SwiftUI
import SwiftData

struct BookDetailView: View {
    @ObservedObject var controller: BookManagement
    @State var item: Item
    @State private var showEdit: Bool = false
    @State private var editTitle: String = ""
    @State private var editAuthor: String = ""
    @State private var editGenre: String = ""
    @State private var editTotalPages: String = ""
    @State private var editPagesRead: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Book Details")) {
                Text("Title: \(item.title)")
                Text("Author: \(item.author)")
                Text("Genre: \(item.genre ?? "N/A")")
                Text("Total Pages: \(item.totalPages)")
                Text("Pages Read: \(item.pagesRead)")
                
                // Directly use item.dateAdded since it's not optional
                Text("Date Added: \(formattedDate(item.dateAdded))")
                
                ProgressView(value: item.progress)
                    .padding()
            }
            
            Section {
                Button("Edit Book") {
                    showEdit = true
                    // Pre-fill the edit form with current values
                    editTitle = item.title
                    editAuthor = item.author
                    editGenre = item.genre ?? ""
                    editTotalPages = String(item.totalPages)
                    editPagesRead = String(item.pagesRead)
                }
            }
        }
        .navigationTitle(item.title)
        .alert("Edit Book", isPresented: $showEdit) {
            TextField("Enter book title", text: $editTitle)
            TextField("Enter author", text: $editAuthor)
            TextField("Enter genre", text: $editGenre)
            TextField("Enter total pages", text: $editTotalPages)
                .keyboardType(.numberPad)
            TextField("Enter pages read", text: $editPagesRead)
                .keyboardType(.numberPad)
            Button("Save") {
                // Validate inputs before saving
                if let totalPages = Int(editTotalPages), let pagesRead = Int(editPagesRead) {
                    // Update the item properties with the edited values
                    item.title = editTitle
                    item.author = editAuthor
                    item.genre = editGenre.isEmpty ? nil : editGenre
                    item.totalPages = totalPages
                    item.pagesRead = pagesRead
                    
                    controller.fetchItems()
                }
                showEdit = false
            }
            Button("Cancel", role: .cancel) {
                showEdit = false
            }
        } message: {
            Text("Edit the details of the book.")
        }
    }
    
    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
