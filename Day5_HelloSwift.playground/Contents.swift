import UIKit

var fruits = ["Apple", "Banana", "Mango"]

print(fruits[0])

fruits[1] = "Orange"
print(fruits)


fruits.append("Pineapple")

fruits.remove(at: 2)
print(fruits)


var countries = [
    "Tokyo" : "Japan",
    "New York" : "USA",
    "Paris" : "France"
]

print(countries["Tokyo"]!)

countries["Rome"] = "Italy"
print(countries)

countries.removeValue(forKey: "Paris")
print(countries)

var luckyNumbers: Set = [7, 11, 13, 17]

luckyNumbers.insert(19)
print(luckyNumbers)

luckyNumbers.remove(13)
print(luckyNumbers)

let favoriteNumbers : Set = [1, 8, 11, 23, 30]
for number in favoriteNumbers {
    print("Lucky number: \(number)")
}

let shoppingList = ["Shirt", "Jeans", "Socks"]

for item in shoppingList {
    print("\(item)")
}

let birthYears = [
    "Alice" : 1990,
    "Bob" : 1995,
    "Charlie" : 2000
]
for (name, year) in birthYears {
    print("\(name) was born in \(year)")
}

var randomNumbers = [1,8, 10, 12, 24, 30]
for number in randomNumbers{
    if number > 10{
        print(number)}
}

var count = 1
while count <= 5 {
    print("Count is \(count)")
    count += 1
}

var countdown = 5
while countdown > 0 {
    print("Countdown: \(countdown)")
    countdown -= 1
}

print("Blast off!")

var number = 1
while number <= 7 {
    print("Count is \(number)")
    number += 1
}
print("Finished counting!")

var lives = 3
repeat {
    print("You have \(lives) lives left.")
    lives -= 1
}while lives > 0
    print("Game Over!")

