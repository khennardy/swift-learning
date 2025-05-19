//
//  ContentView.swift
//  HabitTracker
//
//  Created by Khennardy Sutanto on 2025/05/19.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Wake up early"),
        TaskItem(title: "Workout"),
        TaskItem(title: "Read 10 pages")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.isDone {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
        }
    }
}
