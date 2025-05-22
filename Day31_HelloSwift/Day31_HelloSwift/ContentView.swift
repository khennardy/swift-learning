//
//  ContentView.swift
//  Day31_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        Text("Edit Profile Screen")
            .font(.title)
            .navigationTitle(Text("Edit Profile"))
    }
}

struct ProfileCardView: View {
    @State private var scale: CGFloat = 1.0
    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                profileImage
                
                Text("Harumichi")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.primary)
                
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
                
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.top)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
            .padding()
            .navigationTitle("My Profile")
            
        }
    }
    
    var profileImage: some View {
        if UIImage(named: "HARUMICHI_LOGO") != nil {
            return AnyView(
                Image("HARUMICHI_LOGO")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .scaleEffect(scale)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                            scale = 1.2
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring()) {
                                scale = 1.0
                        }
                    }
                }
            )
        } else {
            return AnyView(
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
        )
        }
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
