import UIKit

// protocols //

protocol Greetable {
    func greet()
}

protocol Identifiable {
    var id: String { get }
}
struct User: Identifiable {
    var id: String
}

let user = User(id: "123-ABC")
print(user.id)

func displayID(for item: Identifiable) {
    print("ID: \(item.id)")
}
let user1 = User(id: "abc123")
displayID(for: user1)

struct Product : Identifiable {
    var id: String
}
let product = Product(id: "prod-001")
displayID(for: product)

// final challenge : describable protocol //
protocol Describable {
    func describe()
}

struct User : Describable {
    var id: String
    func describe() {
        print("User id is \(id)")
    }
}

struct Product : Describable {
    var id: String
    func describe() {
        print("Product id is \(id)")
    }
}

let user2 = User(id: "user-456")
let product1 = Product(id: "prod-789")


