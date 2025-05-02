import UIKit

func sayHello(){
    print("Hello!")
}

sayHello()

func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Alice")
greet(name: "Bob")

func addTwoNumbers(a: Int, b: Int) -> Int {
    return a + b
}

let result = addTwoNumbers(a: 3, b: 5)
print(result)

func multiplyNumbers(a: Int, b:Int) -> Int {
    return a * b
}

let multiplyResult = multiplyNumbers(a: 4, b: 3)
print(multiplyResult)

var name: String? = "Alice"
print(name!)

var nickname : String? = "SwiftMaster"
if let unwrappedNickname = nickname {
    print("Hello, \(unwrappedNickname)")
}else {
    print("No nickname set.")
}

func login(userID: String?){
    guard let user = userID else {
        print("No user ID. Cannot login.")
        return
    }
    print("Hello, \(user)!")
}

login(userID: "Khennardy")
login(userID: nil)

func showFavoriteColor(color: String?){
    guard let favoriteColor = color else {
        print("No favorite color set.")
        return
    }
    print("Your favorite color is \(favoriteColor)!")
}

showFavoriteColor(color: "purple")
showFavoriteColor(color: nil)
