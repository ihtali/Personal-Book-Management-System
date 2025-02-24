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
    
    var body: some View {
        NavigationStack {
            List {
                // Group books by genre
                ForEach(groupedBooksByGenre.sorted(by: { $0.key < $1.key }), id: \.key) { genre, books in
                    Section(header: Text(genre)) {
                        ForEach(books, id: \.id) { item in
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Author: \(item.author)")
                                    .font(.subheadline)
                                Text("Category: \(item.category?.name ?? "Uncategorized")")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Genres")
        }
        .onAppear {
            controller.setModelContext(modelContext)
        }
    }
    
    // Helper function to group books by genre
    private var groupedBooksByGenre: [String: [Item]] {
        Dictionary(grouping: controller.todoItems, by: { $0.genre ?? "Uncategorized" })
    }
}

#Preview {
    CategoryView()
        .modelContainer(for: [Item.self, Category.self], inMemory: true)
}
