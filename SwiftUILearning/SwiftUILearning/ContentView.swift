//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Khennardy Sutanto on 2025/05/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
            
            Text("Welcome, Harumichi!")
                .font(.title)
                .foregroundColor(.green)
            
            Text("Let's build something great together!")
                .font(.subheadline)
                .italic()
            
            HStack(spacing: 16) {
                Text("Left")
                Text("Center")
                Text("Right")
            }
            
            ZStack {
                Color.yellow
                Text("Hello on top!")
                    .font(.title)
                }
            .frame(width: 200, height: 100)
            .cornerRadius(10)
        
        }
        .padding()
    }
}

// show live preview //
#Preview {
    ContentView()
}

