import UIKit

let age = 18
if age < 13 {
    print("You are a child!")
}else if age <= 19{
    print("You are a teenager!")
}else{
    print ("You are an adult!")
}
let score = 85
switch score{
case 0..<50:
    print("Failed (E)")
case 50..<60:
    print("Barely Passed (D)")
case 60..<70:
    print("Pass (C)")
case 70..<80:
    print("Good (B)")
case 80..<90:
    print("Very Good (A)")
case 90...100:
    print("Excellent (A+)")
default:
    print("Invalid Score")
}

let number = 3
switch number {
case 0:
    print("Zero")
case 1:
    print("One")
case 2, 3, 4:
    print("A few")
case 90...100:
    print("Excellent!")
default:
    print("Many")
}
