import UIKit



let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]


let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]

let abbreviations = ["m": "meters", "km": "kilometers"]
let meters = abbreviations["m", default: "m"]


var cats = 0
while cats < 10 {
    cats += 1
    print("I'm getting another cat.")
    if cats == 4 {
        print("enough cats!")
    } else {
        continue
    }
}

repeat {
    print ("This is false")
} while false


for i in 1...15 {
    if i % 3 == 0 {
        if i % 5 == 0 {
            print("\(i) is a multiple of both 3 and 5.")
        }
    }
}

var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 0
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal

let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
var position = 0
while position <= 7 {
    let value = fibonacci[position]
    position += 1
    if value < 2 {
       continue
    }
    print("Fibonacci number \(position) is \(value)")
}

var distanceFlown = 0
while true {
    distanceFlown += 100
    if distanceFlown == 500 {
        continue
    }
    print(distanceFlown)
    if distanceFlown == 1000 {
        break
    }
}

for i in 1...5 {
    if i == 5 {
        continue
    }
    let sum = i + i
    print("\(i) + \(i) is \(sum).")
}

var carsProduced = 0
repeat {
    carsProduced += 1
    if carsProduced % 2 == 0 {
        continue
    }
    print("Another car was built.")
} while carsProduced < 10


func format(number: Int) -> String {
    return "The number is \(number)"
}


func giveDog(food: String) -> String {
    if food == "treat" {
       return "The dog ate it"
    } else {
       return "The dog stared in disgust"
    }
}

func increaseVolume(for device: String) -> String {
    return "\(device) is now louder"
}

func calculateWages(payBand: Int, isOvertime: Bool = false) -> Int {
    var pay = 10_000 * payBand
    if isOvertime {
        pay *= 2
    }
    return pay
}
calculateWages(payBand: 5, isOvertime: true)

func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")

enum PlayError: Error {
    case cheating
    case noPlayers
}
func playGame(name: String, cheat: Bool = false) throws {
    if cheat {
        throw PlayError.cheating
    } else {
        print("Let's play a game of \(name)...")
    }
}

enum MeasureError: Error {
    case unknownItem
}
func measure(itemName: String) throws -> Double {
    switch itemName {
    case "bookcase":
        return 2.0
    case "chair":
        return 1.0
    case "child":
        return 1.3
    case "adult":
        return 1.75
    default: return 0
    }
}

func play(games: String...) {
    for game in games {
        print("Let's play \(game)!")
    }
}
play(games: "Chess", "Baseball")


func paintWalls(tastefully: Bool, color: inout String) {
    if tastefully {
        color = "cream"
    } else {
        color = "tartan"
    }
}
var color = ""
paintWalls(tastefully: true, color: &color)

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")



class Camel {
    var humps: Int
    init?(humpCount: Int) {
        guard humpCount <= 2 else { return nil }
        humps = humpCount
    }
}
let horse = Camel(humpCount: 3)


class Hotel {
    var starRating: Int
    init?(rating: Int) {
        if rating <= 1 {
            print("This probably has bed bugs.")
            return nil
        }
        self.starRating = rating
    }
}
let hotelElan = Hotel(rating: 1)


var str = ""
for i in 1...5 {
    str += "\(i)"
}
str.count == 5

let movies = ["A New Hope", "Empire Strikes Back", "Return of the Jedi"]
movies.firstIndex(of: "A New Hope") == 0

var examScores = [100, 95, 92]
examScores.insert(98, at: 1)

struct Amplifier {
    static let maximumVolume = 11
    var currentVolume: Int
}

struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}

class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}
let monkeyIsland = VideoGame(heroName: "Guybrush Threepwood", enemyName: "LeChuck")

class Empty { }
let nothing = Empty()

class Attendee {
    var badgeNumber = 0
    var name = "Anonymous"
    var company = "Unknown"
    init(badge: Int) {
        self.badgeNumber = badge
    }
}


class Singer {
    var name: String
    var favoriteSong: String
    init(name: String, song: String) {
        self.name = name
        self.favoriteSong = song
    }
}
let taylor = Singer(name: "Taylor Swift", song: "Blank Space")
