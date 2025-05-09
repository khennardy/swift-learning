import UIKit

/* Computed property */

struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
}

let rect = Rectangle(width: 5, height: 10)
print("Area: \(rect.area)")

/* code above is read-only because it is using return , we can use get and set to read-write as below */
struct Rectangle1 {
    var width: Double
    var height: Double
    
    var area: Double {
        get {
            return width * height
        }
        set {
            width = sqrt(newValue)
            height = sqrt(newValue)
        }
    }
}

let rect1 = Rectangle1(width: 100, height: 12)
print("Area: \(rect1.area)")

/* mini practice challeng */
struct Movie {
    var title: String
    var rating: Double
    
    var ratingDescription: String {
            if rating >= 8.0 {
                return "Excellent"
            } else if rating >= 5.0{
                return "Good"
            } else {
                return "Poor"
            }
    }
}

var myMovie = Movie(title: "Inception", rating: 8.8)
print(myMovie.ratingDescription)

/* small practice challenge */
struct Player {
    var name: String
    var score: Int
    
    mutating func increaseScore(by points: Int) {
        score += points
    }
    
    var level: String {
        if score >= 100 {
            return "Pro"
        } else {
            return "Amateur"
        }
    }
}

var player = Player(name: "Alice", score: 90)
print(player.level)
player.increaseScore(by: 100)
print(player.level)

struct BasketballPlayer {
    var name: String
    var points: Int
    
    mutating func scorePoints(by newPoints: Int) {
        points += newPoints
    }
    
    var performance: String {
        if points >= 50 {
            return "MVP Caliber"
        } else if points >= 20 {
            return "Good Player"
        } else {
            return "Average Player"
        }
    }
}

var Basketballplayer1 = BasketballPlayer(name: "Curry", points:45)
print(Basketballplayer1)
Basketballplayer1.scorePoints(by: 10)
print(Basketballplayer1, Basketballplayer1.performance)

var BasketballPlayer2 = BasketballPlayer(name: "LeBron", points:25)
print(BasketballPlayer2)
BasketballPlayer2.scorePoints(by: 30)
print(BasketballPlayer2, BasketballPlayer2.performance)

var BasketballPlayer3 = BasketballPlayer(name: "Durant", points:15)
print(BasketballPlayer3)
BasketballPlayer3.scorePoints(by: 20)
print(BasketballPlayer3, BasketballPlayer3.performance)

let allPlayers: [BasketballPlayer] = [Basketballplayer1, BasketballPlayer2, BasketballPlayer3]

let topPerformingPlayer = allPlayers.max(by: { $0.points < $1.points })!
print("Top Performer: \(topPerformingPlayer.name) with \(topPerformingPlayer.points) points")


