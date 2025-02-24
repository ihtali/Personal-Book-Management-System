//
//  BookManagement.swift
//  Personal Book Management System
//
//  Created by Ali, Ihtasham on 06/02/2025.
//
import SwiftUI
import SwiftData

class BookManagement: ObservableObject {
    private var modelContext: ModelContext?
    @Published var todoItems: [Item] = []
    @Published var categories: [Category] = []
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        fetchItems()
        fetchCategories()
    }
    
    func setModelContext(_ context: ModelContext) {
        modelContext = context
        fetchItems()
        fetchCategories()
    }
    
    func fetchItems() {
        guard let modelContext = modelContext else { return }
        do {
            todoItems = try modelContext.fetch(FetchDescriptor<Item>())
        } catch {
            print("Failed to fetch items: \(error)")
        }
    }
    
    func fetchCategories() {
        guard let modelContext = modelContext else { return }
        do {
            categories = try modelContext.fetch(FetchDescriptor<Category>())
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }
    
    func addItem(title: String, author: String, genre: String?, totalPages: Int, to category: Category?) {
        guard let modelContext = modelContext else { return }
        guard !title.isEmpty else { return }
        let newItem = Item(title: title, author: author, genre: genre, totalPages: totalPages, category: category)
        modelContext.insert(newItem)
        saveContext()
        fetchItems()
    }
    
    func deleteItem(_ item: Item) {
        guard let modelContext = modelContext else { return }
        modelContext.delete(item)
        saveContext()
        fetchItems()
    }
    
    private func saveContext() {
        guard let modelContext = modelContext else { return }
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
