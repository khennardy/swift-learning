import UIKit

let numbers = [1, 2, 3, 4, 5]
/* filter */
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers)
/* map */
let doubled = numbers.map { $0 * 2 }
print(doubled)
/* reduce */
let total = numbers.reduce(0) { $0 + $1 }
print(total)

/* practice filter */
let Numbers = [3, 6, 8, 10, 15]
let filtered = Numbers.filter { $0 > 8 }
print(filtered)
/* practice map */
let squareNumbers = [1, 2, 3]
let square = squareNumbers.map { $0 * $0 }
print(square)
/* practice reduce */
let multiplyNumbers = [2, 4, 6]
let multiply = multiplyNumbers.reduce(1) { $0 * $1 }
print(multiply)

/* super challenge of combining filter + map + reduce */

let givenNumbers = [2, 5, 8, 12, 3, 7]
let result = givenNumbers
    .filter { $0 > 5 }
    .map { $0 * 2 }
    .reduce(0) { $0 + $1 }
print(result)

/* Mini Project: Student grade calculator */
let students = [
    ("Alice", 82),
    ("Bob", 58),
    ("Charlie", 91),
    ("Diana", 47),
    ("Eve", 76)
]

let passingGrade = students.filter { $0.1 >= 60 }
print(passingGrade)

let congratMessages = passingGrade.map { "\($0.0) is doing great!" }
print(congratMessages)

let totalPassingStudents = passingGrade.reduce(0) { total, _ in total + 1 }
print("Total passing students: \(totalPassingStudents)")
