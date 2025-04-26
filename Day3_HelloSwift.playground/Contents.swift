import UIKit
func multiplyNumbers(a: Int, b: Int) -> Int {
    return a * b
}
let sum = multiplyNumbers(a: 10, b: 100)
print(sum)


func introduce(name: String, age: Int) -> String {
    return "Hi, my name is \(name) and I am \(age) years old"
}
print(introduce(name: "Khennardy", age: 30))

let age = 20

if age >= 18 {
    print("You are an adult.")
} else {
    print("You are a minor.")
}

let score = 99

if score >= 90 {
    print("Grade: A")
} else if score >= 80 {
    print("Grade B")
} else if score >= 70 {
    print("Grade C")
} else {
    print("Grade F")
}

let isStudent = true
let isMember = false

if isStudent || isMember {
    print("You get a discount!")
} else {
    print("No discount.")
}

let isSunny = true
let isWeekend = true
if isSunny && isWeekend {
    print("Perfect day for a picnic!")
}

let day = "Monday"

switch day {
case "Monday":
    print("Start of the week")
case "Friday":
    print("Almost Weekend")
case "Saturday", "Sunday":
    print("Weekend!")
default:
    print("Just another day")
}


func canDrive(age: Int, hasLicense: Bool) -> String{
    if age >= 18 && hasLicense == true{
        return "You can drive."
    }else if age >= 18 && hasLicense == false {
        return "You cant drive."
    }else {
        return "You are too young too drive"
    }
}
print(canDrive(age: 20, hasLicense: true))


var fruits = ["Apple", "Banana", "Cherry"]
fruits.append("Durian")
print(fruits)

let names = ["Khennardy", "Sakura", "Haruto"]

for name in names{
    print("Hello, \(name)!")
}

for (index, name) in names.enumerated() {
    print("\(index): \(name)")
}


func printShoppingList(items: [String]) {
    for (index, item) in items.enumerated(){
        print("Item \(index + 1): \(item)")
    }
}
let shopping = ["Apple", "Banana", "Milk"]
printShoppingList(items: shopping)

func greetFriends(friends: [String]) {
    for friend in friends{
        print("Hello, \(friend)!")
    }
}
let mates = ["Sakura", "Haruto", "Khennardy"]
greetFriends(friends: mates)

let menu = ["Burger", "Fries", "Soda", "Pizza", "Salad"]
func showMenu(items: [String]) {
    print("Welcome to Swift Restaurant!")
    print("Here's our menu:")
    for (index, item) in items.enumerated(){
        print("\(index + 1). \(item)")
    }
}
func orderItem(item: String){
    print("You ordered: \(item)")
    print("Thank you for your order!")
}
showMenu(items: menu)

orderItem(item: "Burger")
