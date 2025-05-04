import UIKit

struct Car {
    var brand: String
    var model: String
    var year: Int
}

var myCar = Car(brand: "Toyota", model: "Corolla", year: 2025)
print(myCar)

print(myCar.model)

struct Book {
    var title: String
    var author: String
    var pages: Int
}

var myBook = book(title: "Harry Potter", author: "JK Rowling", pages: 350)

print(myBook)
print(myBook.author)

enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var today = Day.sunday
print(today)

switch today {
case .monday:
    print("Start of the work week.")
case .friday:
    print("Weekend almost over!")
default:
    print("Just another day.")
}

enum Weather {
    case sunny, rainy, cloudy, stormy
}

var todayWeather = Weather.sunny
print(todayWeather)

switch todayWeather {
case .sunny:
    print("Go for a walk!")
case .rainy:
    print("Stay indoors and read a book.")
default:
    print("Enjoy the weather!")
}



