import UIKit

func calculateStats(numbers: [Int]) -> (sum: Int, count: Int) {
    let sum = numbers.reduce(0, +)
    let count = numbers.count
    return (sum, count)
}

let result = calculateStats(numbers: [5, 10, 15])
print("Sum: \(result.sum), Count: \(result.count)")

func add(a: Int, b: Int) -> Int {
    return a + b
}

var mathOperation : (Int, Int) -> Int = add
let result2 = mathOperation(3, 5)
print(result2)

let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

let product = multiply(4, 5)
print(product)

func divideNumber(a: Int, b: Int) -> (quotient: Int, remainder: Int) {
    return (a / b, a % b)
}

let divisionResult = divideNumber(a: 10, b: 3)
print("Quotient: \(divisionResult.quotient), Remainder: \(divisionResult.remainder)")

let divide = {(c: Int, d: Int) in
    return (c / d, c % d)
}

let product2 = divide(19, 4)
print("Quotient: \(product2.0), Remainder: \(product2.1)")

func multiplyByTwo(f: Int, g: Int) -> Int {
    return f * g
}

var multiplyByTwoFunction : (Int, Int) -> Int = multiplyByTwo
let multiplyResult = multiplyByTwoFunction(10, 3)
print(multiplyResult)


let school = {(a: String, b: String) in
    return "\(a) \(b)"
}
    
(/* interactive calculator */)

import Foundation

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
}

func performOperation(_ operation: Operation, _ a: Double, _ b: Double) -> Double {
    let result: Double
    
    switch operation {
    case .addition:
        result = a + b
    case .subtraction:
        result = a - b
    case .multiplication:
        result = a * b
    case .division:
        if b == 0 {
            print("Error: division by zero is not allowed!")
            return 0.0
        } else {
            result = a / b
        }
    }
    
    return result
}
while true {
    print("Enter first number (or type 'exit'):")
    guard let firstInput = readLine() else {
        print("Invalid input for first number.")
        continue
    }
    if firstInput.lowercased() == "exit" {
        print("Goodbye!")
        break
    }
    guard let number1 = Double(firstInput) else {
        print("Invalid number. Please try again.")
        continue
    }
    
    print("Enter second number (or type 'exit'):")
    guard let secondInput = readLine() else {
        print("Invalid input for second number.")
        continue
    }
    if secondInput.lowercased() == "exit" {
        print("Goodbye!")
        break
    }
    guard let number2 = Double(secondInput) else {
        print("Invalid number. Please try again.")
        continue
    }
    
    print("Choose your operator (add, subtract, multiply, divide)(or type 'exit'):")
    guard let operatorInput = readLine() else {
        print("Invalid input for operator.")
        continue
    }
    if operatorInput.lowercased() == "exit" {
        print("Goodbye!")
        break
    }
    
    let operation: Operation
    
    switch operatorInput.lowercased() {
    case "add":
        operation = .addition
    case "subtract":
        operation = .subtraction
    case "multiply":
        operation = .multiplication
    case "divide":
        operation = .division
    default:
        print("Invalid operator.")
        exit(1)
    }
    
    let result = performOperation(operation, number1, number2)
    print(String(format: "Result: %.2f", result))
    
    print("Would you like to perform another calculation? (yes/no")
    if let againInput = readLine(), againInput.lowercased() == "no" {
        print("Goodbye!")
        break
    }
    
}
