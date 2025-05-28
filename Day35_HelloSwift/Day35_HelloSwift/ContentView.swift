//
//  ContentView.swift
//  Day35_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/28.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var name: String
    var bio: String
}

struct UserListView: View {
    @State private var users = [
        User(name: "Harumichi", bio: "iOS Developer"),
        User(name: "Khennardy", bio: "SwiftUI Developer"),
        User(name: "Nico", bio: "Android Developer")
    ]
    
    @State private var showAddUser = false
    
    var body: some View {
        NavigationStack {
            List(users) {user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.bio)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Team Members")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddUser = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddUser) {
                AddUserView(users: $users)
            }
        }
    }
}
    
struct UserDetailView: View {
        let user: User
        
        var body: some View {
            VStack(spacing: 20) {
                Text(user.name)
                    .font(.largeTitle)
                    .bold()
                
                Text(user.bio)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            .padding()
            .navigationTitle("Profile")
            
        }
}
    
struct AddUserView: View {
        @Environment(\.dismiss) var dismiss
        @Binding var users: [User]
        
        @State private var name = ""
        @State private var bio = ""
        
        var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("Name")) {
                        TextField("Enter name", text: $name)
                    }
                    Section(header: Text("Bio")) {
                        TextField("Enter bio", text: $bio)
                    }
                }
                .navigationTitle("New Member")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            let newUser = User(name: name, bio: bio)
                            users.append(newUser)
                            dismiss()
                        }
                        .disabled(name.isEmpty || bio.isEmpty)
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
}
    
struct EditProfileView: View {
        @Binding var name: String
        @Binding var bio: String
        @State private var showAlert = false
        
        var body: some View {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter your name", text: $name)
                }
                
                Section(header: Text("Bio")) {
                    TextEditor(text: $bio)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveProfile()
                    }
                }
            }
            .onDisappear {
                saveProfile()
            }
            .alert("Profile Saved", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        func saveProfile() {
            print("Saving: \(name), \(bio)")
            showAlert = true
        }
    }
    
struct ProfileCardView: View {
        @State private var scale: CGFloat = 1.0
        @AppStorage("name") private var name: String = "Harumichi"
        @AppStorage("bio") private var bio: String = "iOS Developer"
        
        var body: some View {
            NavigationStack{
                VStack(spacing: 16) {
                    profileImage
                    
                    Text(name)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.primary)
                    
                    Text(bio)
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
                    
                    NavigationLink(destination: EditProfileView(name: $name, bio: $bio)) {
                        Text("Edit Profile").actionButtonStyle()
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
    
extension View {
        func actionButtonStyle() -> some View {
            self
                .font(.subheadline)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
        }
    }
    
    #Preview {
        UserListView()
    }

