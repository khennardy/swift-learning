//
//  ContentView.swift
//  Day29_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/21.
//

import SwiftUI

struct SettingRowView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                settingRow(icon: "gearshape", label: "Settings")
                Divider()
                settingRow(icon: "envelope", label: "Email Notifications")
            }
            .background(Color.yellow)
            .cornerRadius(5)
            .shadow(radius: 2)
            .padding(.horizontal)
            
            settingCard(icon: "bell", label: "Push Alerts")
        }
        .padding()
    }
    
    func settingRow(icon: String, label: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(label)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
    
    func settingCard(icon: String, label: String) -> some View {
        VStack(spacing: 0) {
            HStack {
                settingRow(icon: icon, label: label)
            }
            
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    SettingRowView()
}
