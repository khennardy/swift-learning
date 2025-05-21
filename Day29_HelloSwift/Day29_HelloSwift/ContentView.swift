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
                Divider()
                settingRow(icon: "lock", label: "Password & Security")
                Divider()
                settingRow(icon: "bell", label: "Push Alerts")
            }
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal)
            
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
    
    func settingRow(icon: String, label: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.blue)
            Text(label)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
    
}

#Preview {
    SettingRowView()
}
