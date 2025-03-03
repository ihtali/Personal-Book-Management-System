//
//  HomeView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 23/02/2025.
//
import SwiftUI
import SwiftData

struct LibraryView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var controller = BookManagement()
    @State private var searchQuery: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Library")
                    .font(.title)
                    .padding(.top)
                
                // Search Bar
                TextField("Search Books...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                List {
                    // Filter books based on search query
                    ForEach(controller.todoItems.filter { item in
                        searchQuery.isEmpty || item.title.localizedCaseInsensitiveContains(searchQuery)
                    }, id: \.id) { item in
                        NavigationLink(destination: BookDetailView(controller: controller, item: item)) {
                            Text(item.title)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let item = controller.todoItems[index]
                            controller.deleteItem(item)
                        }
                    }
                }
            }
            .navigationTitle("Library")
        }
        .onAppear {
            controller.setModelContext(modelContext)
            controller.fetchItems() // Refresh the list when the view appears
        }
    }
}

#Preview {
    LibraryView()
        .modelContainer(for: [Item.self], inMemory: true)
}
