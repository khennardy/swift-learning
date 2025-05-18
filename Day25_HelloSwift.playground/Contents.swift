import UIKit

// day 25: protocol composition + type casting //

protocol CanBark {
    func bark()
}

protocol CanRun {
    func run()
}

struct Dog: CanBark, CanRun {
    func bark() {
        print("Woof!")
    }
    
    func run() {
        print("Running fast!")
    }
}

func performTricks(_ pet: CanBark & CanRun) {
    pet.bark()
    pet.run()
}

let dog = Dog()
performTricks(dog)
// CanBark & CanRun is called Protocol composition //

// step 2: Type casting with protocols //

protocol Identifiable {
    var id: String { get }
}

struct Student: Identifiable {
    var id: String
}

let item: Any = Student(id: "S123")

if let student = item as? Identifiable {
    print("Student ID: \(student.id)")
}

// daily challenge //

protocol HasName {
    var name: String { get }
}

protocol CanWork {
    func work()
}

struct Intern: HasName, CanWork {
    var name: String
    
    func work() {
        print("I am doing intern tasks.")
    }
}

func introduceWorker(_ person: HasName & CanWork) {
    print("Hi, my name is \(person.name) and I am working!")
    person.work()
}

let intern = Intern(name: "Alex")
introduceWorker(intern)
