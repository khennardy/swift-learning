//
//  ContentView.swift
//  Day28_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/20.
//

import SwiftUI

struct StackChallengeView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                Text("Harumichi")
                    .font(.title)
                    .bold()
                
                Text("iOS Learner")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
                HStack(spacing: 40) {
                    Image(systemName: "phone.fill")
                    Image(systemName: "envelope.fill")
                    Image(systemName: "globe")
                }
                .font(.title2)
                .foregroundColor(.blue)
                    
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    StackChallengeView()
}
