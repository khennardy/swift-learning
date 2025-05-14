import UIKit
// step 1: what is protocol extension//
protocol Greetable {
    func greet()
}

extension Greetable {
    func greet() {
        print("Greetings from Protocol!")
    }
}

struct Robot: Greetable{}

let r2d2 = Robot()
r2d2.greet()

// step 2: overriding the default //
struct Human: Greetable {
    func greet() {
        print("Hello, I am a human!")
    }
}

let human = Human()
human.greet()
