import UIKit

// if let and guard let //

// optional //
var name: String? = "Khen"

// unwrapping optional. method 1. //
if let unwrapped = name {
    print("Name is \(unwrapped)")
} else {
    print("No name is provided")
}

// unwrapping optional. method 2. //
func greet(name: String?) {
    guard let unwrapped = name else {
        print("No name to greet")
        return
    }
    print("Hello, \(unwrapped)")
}

// mini challenge //
func displayAge(age: Int?){
    if let unwrappedAge = age {
        print("Age is \(unwrappedAge)")
    } else {
        print("No age provided")
    }
}

displayAge(age: 30)
displayAge(age: nil)

// Optional Chaining //
struct User {
    var profile: Profile?
}
struct Profile {
    var email: String
}

let user = User(profile: Profile(email: "test@example.com"))
print(user.profile?.email)

let user2 = User(profile: nil)
print(user2.profile?.email)

// step 3 challenge //
struct Device {
    var owner: Owner?
}

struct Owner {
    var name: String
}

let device = Device(owner: Owner(name: "Khen"))
print(device.owner?.name)

let device2 = Device(owner: nil)
print(device2.owner?.name)

// step 4 : Nil Coalescing (??) //
let finalName = device.owner?.name ?? "No Owner"

let known = device.owner?.name ?? "Unknown Owner"
let unknown = device2.owner?.name ?? "Unknown Owner"
print(known)
print(unknown)

// final challenge day 19 //
struct Person {
    var name: String?
    var age: Int?
    
    func describe() {
        print("Name: \(name ?? "Unknown")")
        
        if let actualAge = age {
            print("Age: \(actualAge)")
        } else {
            print("Age: not provided")
        }
    }
}

let person1 = Person(name: "Khenn", age: 27)
person1.describe()

let person2 = Person(name: nil, age: nil)
person2.describe()

