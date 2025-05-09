import UIKit

struct BankAccount {
    private var balance: Int = 0
    
    mutating func deposit(_ amount: Int) {
        balance += amount
    }
    
    func showBalance() -> Int {
        return balance
    }
}

var myAccount = BankAccount()
myAccount.deposit(100)
print(myAccount.showBalance())

struct ScoreTracker {
    private(set) var score = 0
    
    mutating func addPoint() {
        score += 1
    }
}

let tracker = ScoreTracker()
print(tracker.score)


struct LevelSystem {
    private(set) var level = 1
    
    mutating func levelUp() {
        level += 1
    }
}

var levelCheck = LevelSystem()
print(levelCheck.level)
levelCheck.levelUp()


struct SecureUser {
    var username : String
    private(set) var loginAttempts: Int = 0
    private var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    mutating func checkPassword (_ input: String) -> Bool {
        if input == password {
            return true
        } else {
            incrementLoginAttempts()
            return false
        }
    }
    mutating func incrementLoginAttempts() {
            loginAttempts += 1
        }
    mutating func resetLoginAttempts() {
            loginAttempts = 0
        }
    }

var user = SecureUser(username: "Khen", password: "12345")

print(user.username)
user.username = "Khennardy"
print(user.loginAttempts)

print(user.checkPassword("12345"))

print(user.loginAttempts)

struct Counter {
    var value = 0
    
    mutating func increment() {
        value += 1
    }
}

var counter = Counter()
print(counter.value)
counter.increment()
print(counter.value)
counter.increment()
print(counter.value)


struct WaterTracker {
    var cupsDrank: Int = 0
    mutating func drinkCup() {
        cupsDrank += 1
    }
    mutating func drink (_ amount: Int) {
        cupsDrank += amount
    }
    func showProgress() -> String {
        return "You have drunk \(cupsDrank) cups of water"
    }
    static let dailyGoal = 8
    
    func goalStatus() -> String {
        return cupsDrank >= Self.dailyGoal ? "You are on track!" : "Keep drinking!"
    }
}

var myWaterTracker = WaterTracker()
myWaterTracker.drinkCup()
myWaterTracker.drink(5)
myWaterTracker.showProgress()
print(myWaterTracker.showProgress())
print(myWaterTracker.goalStatus())
