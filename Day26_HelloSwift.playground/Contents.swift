import UIKit

// day 26 : protocols with associated types //

// what is associated types? //

//example without associated types//
//protocol Container {
    //func add(item: String)

//step 1: define the protocol//
protocol Container {
    associatedtype Item
    var items: [Item] { get set }
    mutating func add(item: Item)
}

// step 2: conform the protocol //

struct IntContainer: Container {
    var items = [Int]()
    
    mutating func add(item: Int) {
        items.append(item)
    }
}

var box = IntContainer()
box.add(item: 10)
box.add(item: 20)
print(box.items)

// challenge //

protocol Stackable {
    associatedtype Element
    var stack: [Element] { get set }
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct StringStack: Stackable {
    var stack = [String]()
    
    mutating func push(_ element: Element) {
        stack.append(element)
    }
    mutating func pop() -> String? {
        return stack.popLast()
    }
}

var myStack = StringStack()
myStack.push("Hello")
myStack.push("World")
print(myStack.stack)

let popped = myStack.pop()
print("Popped:", popped ?? "Nothing")
print(myStack.stack)
