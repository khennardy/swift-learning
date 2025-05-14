import UIKit

// day 23 : extend existing types protocols //

// step 1 : what is an extension //
//example: extend Int//

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 5
print(number.squared())

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

let num = 6
print(num.isEven())

//step 2: computed properties in extensions//

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

print(7.isOdd)

extension Int {
    var isPositive: Bool {
        return self > 0
    }
}
print((-1).isPositive)

// final challenge //

extension String {
    var wordCount: Int {
        return self.split(separator: " ").count
    }
}

let sentence = "Hello from Swift extensions and computed properties"
print(sentence.wordCount)

