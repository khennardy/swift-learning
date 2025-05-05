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

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
}

func performOperation(_ operation: Operation, _ a: Int, _ b: Int) -> Int {
    let result : Int
    
    switch operation {
    case .addition:
        let addition = {(x: Int, y: Int) in x + y }
        result = addition(a, b)
    case .subtraction:
        let subtraction = {(x: Int, y: Int) in x - y }
        result = subtraction(a, b)
    case .multiplication:
        let multiplication = {(x: Int, y: Int) in x * y }
        result = multiplication(a, b)
    case .division:
        let division = {(x: Int, y: Int) in x / y }
        result = division(a, b)
    }
    
    return result
}

let number1 = 10
let number2 = 20

let finalResult = performOperation(.multiplication, number1, number2)
print("Result: \(finalResult)")
