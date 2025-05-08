import UIKit

/* class */
class Car {
    var brand = "Toyota"
}

/* properties and methods */ //properties are variable inside a class. (data) //methods are functions inside a class (behavior)
class car {
    var brand = "Toyota" // property
    var speed = 0   // property
    
    func drive() {  //method
        print("Driving at \(speed) km/h")
    }
}

/* creating instances */
let myCar = car()
print(myCar.brand) //Toyota

myCar.speed = 60
myCar.drive()

class Student {
    var name : String
    var grade : Int
    
    init(name: String, grade: Int){
        self.name = name
        self.grade = grade
    }
    func introduce() {
        print("Hi, I'm \(name) and my grade is \(grade)")
    }
}

let student1 = Student(name: "Alice", grade: 3)
let student2 = Student(name: "Bob", grade: 90)

student1.introduce()
student2.introduce()

/* mini project student GPA ranking system */

class student {
    var name : String
    var grade : Int
    
    init(name: String, grade: Int){
        self.name = name
        self.grade = grade
    }
    func checkPass() -> String {
        return grade >= 60 ? "Pass" : "Fail"
    }
}

let students = [
    student(name: "Alice", grade: 82),
    student(name: "Bob", grade: 58),
    student(name: "Charlie", grade: 91),
    student(name: "Diana", grade: 47),
    student(name: "Eve", grade: 76)
]

let sortedStudents = students.sorted { $0.grade > $1.grade}

for student in sortedStudents {
    print("\(student.name) - Grade : \(student.grade) - \(student.checkPass())")
}
