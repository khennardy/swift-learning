import UIKit

/* static in swift */
struct Math {
    static let pi = 3.14159
}
print(Math.pi)

struct BasketballPlayer {
    var name: String
    var points: Int
    
    static var totalPlayers = 0
    static func announcePlayers() {
        print("We currently have \(totalPlayers) players")
    }
    
    init(name: String, points: Int) {
        self.name = name
        self.points = points
        BasketballPlayer.totalPlayers += 1
    }
}

print(BasketballPlayer.totalPlayers)

struct TeamStats {
    static var maxTeamSize = 5
    static func isTeamFull(currentCount: Int) -> Bool {
        return currentCount >= maxTeamSize
    }
    static func canJoinTeam() -> String {
        if BasketballPlayer.totalPlayers < maxTeamSize {
            return "Player can join."
        } else {
            return "Team is full."
        }
    }
}
print(TeamStats.maxTeamSize)

let p1 = BasketballPlayer(name: "LeBron", points: 50)
let p2 = BasketballPlayer(name: "Curry", points: 45)
let p3 = BasketballPlayer(name: "Durant", points: 30)
let p4 = BasketballPlayer(name: "Tatum", points: 25)


print("Total players: \(BasketballPlayer.totalPlayers)")
BasketballPlayer.announcePlayers()

if TeamStats.isTeamFull(currentCount: BasketballPlayer.totalPlayers) {
    print("Team is full")
} else {
    print( "Still room on the team.")
}

print(TeamStats.canJoinTeam())
