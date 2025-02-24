//
//  Personal_Book_Management_SystemApp.swift
//  Personal Book Management System
//
//  Created by Ali, Ihtasham on 06/02/2025.
//
import SwiftUI
import SwiftData

@main
struct Personal_Book_Management_SystemApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Category.self,
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabNavigation()
                .modelContainer(sharedModelContainer)
        }
    }
}
