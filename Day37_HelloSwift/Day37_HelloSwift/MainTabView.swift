//
//  MainTabView.swift
//  Day37_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/28.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ProfileCardView()
                .tabItem {
                    Label("My Profile", systemImage: "person.crop.circle")
                }
            
            UserListView()
                .tabItem {
                    Label("Team", systemImage: "person.3.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}

