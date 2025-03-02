//
//  Item.swift
//  Personal Book Management System
//
//  Created by Ali, Ihtasham on 06/02/2025.
//
import SwiftData
import Foundation

@Model
class Item {
    var id: UUID
    var title: String
    var author: String
    var genre: String?
    var totalPages: Int
    var pagesRead: Int
    var category: Category?

    init(title: String, author: String, genre: String? = nil, totalPages: Int, category: Category? = nil) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.genre = genre
        self.totalPages = totalPages
        self.pagesRead = 0
        self.category = category
    }

    var progress: Double {
        return Double(pagesRead) / Double(totalPages)
    }
}
