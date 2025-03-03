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
    var dateAdded: Date
    
    init(title: String, author: String, genre: String? = nil, pagesRead: Int = 0, totalPages: Int, dateAdded: Date) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.genre = genre
        self.totalPages = totalPages
        self.pagesRead = pagesRead
        self.dateAdded = dateAdded
    }

    var progress: Double {
        return Double(pagesRead) / Double(totalPages)
    }
}
