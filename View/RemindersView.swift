//
//  RemindersView.swift
//  Personal Book Management System
//
//  Created by Ihtasham Ali on 02/03/2025.
//
import SwiftUI
import Foundation

struct Reminder: Identifiable {
    var id = UUID()
    var title: String
    var bookName: String
    var date: Date
}

struct RemindersView: View {
    @State private var reminders: [Reminder] = []
    @State private var showAddReminderSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header Title and Plus Button
                HStack {
                    Text("Reminders")
                        .font(.title)  // Makes the title stand out
                        .padding(.top)
                    
                    Spacer()
                    
                    Button(action: {
                        showAddReminderSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)  // Makes the "+" icon a bit larger
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                
                // Reminder List
                List {
                    if reminders.isEmpty {
                        Text("No reminders yet. Tap the '+' button to add a new reminder.")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        ForEach(reminders) { reminder in
                            VStack(alignment: .leading) {
                                Text(reminder.title)
                                    .font(.headline)
                                Text("Book: \(reminder.bookName)")
                                    .font(.subheadline)
                                Text("Due: \(reminder.date, style: .time)")
                                    .font(.subheadline)
                            }
                        }
                        .onDelete(perform: deleteReminder)
                    }
                }
            }
            .sheet(isPresented: $showAddReminderSheet) {
                AddReminderView(reminders: $reminders)
            }
        }
    }
    
    private func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}

struct AddReminderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var reminders: [Reminder]
    @State private var reminderTitle: String = ""
    @State private var bookName: String = ""
    @State private var reminderDate: Date = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Enter reminder title", text: $reminderTitle)
                    TextField("Enter book name", text: $bookName)
                    DatePicker("Select reminder time", selection: $reminderDate, displayedComponents: .hourAndMinute)
                }
                
                Section {
                    Button("Save Reminder") {
                        let newReminder = Reminder(title: reminderTitle, bookName: bookName, date: reminderDate)
                        reminders.append(newReminder)
                        dismiss()
                    }
                    .disabled(reminderTitle.isEmpty || bookName.isEmpty)
                }
            }
            .navigationTitle("Add Reminder")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    RemindersView()
}
