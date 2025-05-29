//
//  MainTabView.swift
//  Day38_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/29.
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

