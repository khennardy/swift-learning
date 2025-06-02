//
//  ContentView.swift
//  Day39_HelloSwift
//
//  Created by Khennardy Sutanto on 2025/05/30.
//

import SwiftUI

enum Role: String, CaseIterable, Identifiable, Codable {
    case iOS = "iOS"
    case Android = "Android"
    case SwiftUI = "SwiftUI"
    case Others = "Others"
    
    var id: String { self.rawValue }
}

struct User: Identifiable, Codable {
    let id : UUID
    var name: String
    var bio: String
    var role: Role
    
    init(id: UUID = UUID (), name: String, bio: String, role: Role) {
        self.id = id
        self.name = name
        self.bio = bio
        self.role = role
    }
}

struct UserListView: View {
    @State private var users: [User] = [
        User(name: "Harumichi", bio: "iOS Developer", role: .iOS),
        User(name: "Khennardy", bio: "SwiftUI Developer", role: .SwiftUI),
        User(name: "Nico", bio: "Android Developer", role: .Android),
        User(name: "Kenta", bio: "Mobile Lead", role: .Others)
    ]
    
    @State private var showAddUser = false
    @State private var selectedRole: Role? = nil

    var filteredUsers: [User] {
        if let role = selectedRole {
            return users.filter {$0.role == role }
        } else {
            return users
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Filter by Role", selection: $selectedRole) {
                    Text("All").tag(Role?.none)
                    ForEach(Role.allCases, id: \.self) { role in
                        Text(role.rawValue).tag(Optional(role))
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                
                List {
                    ForEach(users.indices, id: \.self) { index in
                        if selectedRole == nil || users[index].role == selectedRole {
                            NavigationLink(destination: EditUserView(user: $users[index])) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(users[index].name)
                                        .font(.headline)
                                    Text(users[index].bio)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .onDelete(perform: deleteUser)
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
                .onAppear {
                    UserDefaults.standard.set("testing", forKey: "testKey")
                    loadUsers()
                }
                
            }
        }
    }
    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "savedUsers")
        }
    }
    func loadUsers() {
        if let savedData = UserDefaults.standard.data(forKey: "savedUsers"),
           let decoded = try? JSONDecoder().decode([User].self, from: savedData) {
               users = decoded
           }
    }
        
}

struct EditUserView: View {
    @Binding var user: User
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter name", text: $user.name)
            }
            Section(header: Text("Bio")) {
                TextField("Bio", text: $user.bio)
            }
            Section(header: Text("Role")) {
                Picker("Role", selection: $user.role) {
                    ForEach(Role.allCases) { role in
                            Text(role.rawValue).tag(role)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Member")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    dismiss()
                }
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
        @State private var role: Role = .Others
        
        var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("Name")) {
                        TextField("Enter name", text: $name)
                    }
                    Section(header: Text("Bio")) {
                        TextField("Enter bio", text: $bio)
                    }
                    Section(header: Text("Role")) {
                        Picker("Select Role", selection: $role) {
                            ForEach(Role.allCases) { role in
                                Text(role.rawValue).tag(role)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .navigationTitle("New Member")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            let newUser = User(name: name, bio: bio, role: role)
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
                ScrollView {
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
                        
                        Button("Reset Profile") {
                            name = "Harumichi"
                            bio = "iOS Developer"
                        }
                        .padding(.top, 8)
                    }
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 8)
                    .padding()
                }
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

struct MainView: View {
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Team", systemImage: "person.3.fill")
                }
            
            ProfileCardView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
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
    MainView()
}
