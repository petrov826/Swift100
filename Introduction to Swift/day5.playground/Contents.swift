import Cocoa

// ----- if -----
let score = 85

if 80 <= score {
    print("You're awesome!")
}


var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)


var playerName = ""
playerName = "Tom"

// we can use playerName == "" or playerName.count == 0
if playerName.isEmpty {
    print("player name is empty")
}

// ----- if-else -----
let mathScore = 90

if mathScore >= 80 {
    print("You're awesome!")
} else if mathScore >= 60 {
    print("Good job")
} else {
    print("more power to you")
}

// ---- switch with enum -----
enum Weather {
    case sunny, rainy, cloudy, snowy, unknown
}
let weather = Weather.sunny
// in switch statement with enum,
// we have to write code for each item
// we can't use default when using enum
// because default will never be executed
switch weather {
case .sunny:
    print("What's a nice day!")
case .rainy:
    print("Rainy day is not so bad")
case .cloudy:
    print("I'll spend a whole day by watching clouds")
case .snowy:
    print("Let's make a snowman!")
case .unknown:
    print("too hard to forecast")
}

let city = "London"
switch city {
case "London":
    print("It's London!")
case "Paris":
    print("It's Paris")
    // we can use default when not using enum
default:
    print("Other city")
}

let countdown = 3
switch countdown {
case 5:
    print("5...")
    fallthrough // go to the below case. it's much better than C's switch-case-break!
case 4:
    print("4...")
    fallthrough
case 3:
    print("3...")
    fallthrough
case 2:
    print("2...")
    fallthrough
default:
    print("Fire!")
}

// ----- ternary conditinal operator -----
let height = 160
let canRide = 150 < height ? true : false

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

enum Theme { case dark, light } // we can declare enum with 1 line
let theme = Theme.dark
let backgroundColor = (theme == .dark) ? "Black" : "White"
