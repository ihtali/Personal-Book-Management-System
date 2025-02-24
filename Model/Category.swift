//
//  Category.swift
//  Personal Book Management System
//
//  Created by Ali, Ihtasham on 06/02/2025.
//
import SwiftUI
import SwiftData

@Model
class Category {
    var id: UUID
    var name: String
    var items: [Item]

    init(name: String) {
        self.id = UUID()
        self.name = name
        self.items = []
    }
}
