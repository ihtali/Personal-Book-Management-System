//
//  BookController.swift
//  Personal Book Management System
//
//  Created by Ali, Ihtasham on 06/02/2025.
//
import SwiftUI
import SwiftData

class BookController: ObservableObject {
    private var modelContext: ModelContext?
    @Published var categories: [Category] = []
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        fetchCategories()
    }
    
    func setModelContext(_ context: ModelContext) {
        modelContext = context
        fetchCategories()
    }
    
    func fetchCategories() {
        guard let modelContext = modelContext else { return }
        do {
            categories = try modelContext.fetch(FetchDescriptor<Category>())
        } catch {
            print("Failed to fetch categories: \(error)")
        }
    }
    
    func addCategory(name: String) {
        guard let modelContext = modelContext else { return }
        let newCategory = Category(name: name)
        modelContext.insert(newCategory)
        fetchCategories()
    }
    
    func deleteCategory(_ category: Category) {
        guard let modelContext = modelContext else { return }
        modelContext.delete(category)
        fetchCategories()
    }
}
