//
//  TabNavigationView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 23/02/2025.
//
import SwiftUI

enum Tab: String, CaseIterable {
    case library
    case addBook
    case categories
}


struct TabNavigation: View {
    @State private var selectedTab: Tab = .library
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Library Tab
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
                .tag(Tab.library)
            
            // Add Book Tab
            AddBookView()
                .tabItem {
                    Label("Add Book", systemImage: "plus")
                }
                .tag(Tab.addBook)
            
            // Category Tab
            CategoryView ()
                .tabItem {
                    Label("Categories", systemImage: "folder")
                }
                .tag(Tab.categories)
        }
    }
}

#Preview {
    TabNavigation()
        .modelContainer(for: [Item.self], inMemory: true)
}
