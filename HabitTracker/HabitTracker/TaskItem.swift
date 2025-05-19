//
//  TaskItem.swift
//  HabitTracker
//
//  Created by Khennardy Sutanto on 2025/05/19.
//
import Foundation

struct TaskItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}
