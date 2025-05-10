import UIKit

// Optional in real life //

// Step 1: Optional in Functions //
func findLongestName(in names: [String]) -> String? {
    return names.max(by: {$0.count < $1.count})
}
let name = findLongestName(in: ["Amy", "Benjamin", "Kai"])
print(name ?? "No name found")

func firstEven(in numbers: [Int]) -> Int? {
    for num in numbers {
        if num % 2 == 0 {
            return num
        }
    }
    return nil
}

let number = firstEven(in: [1, 3, 5, 7, 9, 10])
print(number ?? "No even number found")

// step 2: Optionals in Arrays //
let numbers = [3, 6, 9]

let first = numbers.first
let last = numbers.last
let random = numbers.randomElement()
let maxVal = numbers.max()

print(numbers.first ?? -1)

let firstNumber = [42, 21, 12].first ?? -1
print(firstNumber)

// step 3: Optional chaining across nested structures //
struct User {
    var profile: Profile?
}
struct Profile {
    var address: Address?
}
struct Address {
    var city: String
}
let user = User(profile: Profile(address: Address(city: "Osaka")))
let emptyUser = User(profile: nil)
print(emptyUser.profile?.address?.city ?? "No address")
print(user.profile?.address?.city ?? "No address")

// final challenge: student lookup //
struct TestScore {
    var value: Int
}
struct Student {
    var name: String
    var testScore: TestScore?
}

func printScore(for student: Student){
    if let score = student.testScore?.value {
        print("Score for \(student.name): \(score)")
    } else {
        print("Score for \(student.name): No score")
    }
}

let student1 = Student(name: "Khenn", testScore: TestScore(value: 92))
let student2 = Student(name: "Luna", testScore: nil)

printScore(for: student1)
printScore(for: student2)
