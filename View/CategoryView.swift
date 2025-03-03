//
//  SearchView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 23/02/2025.
//
import SwiftUI
import SwiftData

struct CategoryView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var controller = BookManagement()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Custom Title similar to LibraryView
                Text("Genres")
                    .font(.title)  // Ensures it stands out like LibraryView's title
                    .padding(.top)
                
                // Search Bar
                SearchBar(text: $searchText)
                
                List {
                    // Group filtered books by genre
                    ForEach(filteredGroupedBooksByGenre.sorted(by: { $0.key < $1.key }), id: \.key) { genre, books in
                        Section(header: Text("Category: \(genre)")
                                    .font(.headline)  // Making header more prominent
                                    .padding(.top)) {  // Add padding to separate header from content
                            ForEach(books, id: \.id) { item in
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text("Author: \(item.author)")
                                        .font(.subheadline)
                                    Text("Total pages: \(item.totalPages)")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("")  // Remove the default title to avoid duplication
            }
        }
        .onAppear {
            controller.setModelContext(modelContext)
        }
    }
    
    // Helper function to filter and group books by genre
    private var filteredGroupedBooksByGenre: [String: [Item]] {
        let filteredGenres = controller.todoItems.filter { item in
            searchText.isEmpty || (item.genre?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
        return Dictionary(grouping: filteredGenres, by: { $0.genre ?? "Uncategorized" })
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search by genre...", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryView()
        .modelContainer(for: [Item.self, Category.self], inMemory: true)
}
