//
//  ContentView.swift
//  Day29_HelloSwift(Profile_Card)
//
//  Created by Khennardy Sutanto on 2025/05/21.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("HARUMICHI_LOGO")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .foregroundColor(.gray)
            
            Text("Harumichi")
                .font(.title)
                .bold()
            
            Text("iOS Developer")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Divider()
            
            HStack {
                statItem(title: "FOLLOWERS", value: "1,250")
                Spacer()
                statItem(title: "FOLLOWING", value: "340")
                Spacer()
                statItem(title: "POSTS", value: "89")
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 8)
        .padding()
        .background(Color(.systemGroupedBackground))
    }
    
    func statItem(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.blue)
            Text(value)
                .font(.headline)
                .bold()
        }
    }
}
#Preview {
    ProfileCardView()
}
