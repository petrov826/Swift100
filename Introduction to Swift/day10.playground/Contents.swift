import Cocoa
import Foundation

// ----- struct -----
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let circle = Album(title: "The Circle", artist: "Bon Jovi", year: 2009)
print(circle.year)
circle.printSummary()


struct Employee {
    // properties
    let name: String
    var vacationRemaining : Int = 20
    
    // methods
    // we can't change property using method
    // except it's marked as mutating
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm gonna vacations")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("There're not enough days remaining...")
        }
    }
}

var tom = Employee(name: "Tom", vacationRemaining: 25)
tom.takeVacation(days: 5)

// having vacationRemaining = 20(default)
var bob = Employee(name: "Bob")
bob.takeVacation(days: 5)

// even if method is marked as mutating,
// a constant can't change its properties with method
//let tonny = Employee(name: "Tonny", vacationRemaining: 10)
//tonny.takeVacation(days: 5)


// ----- computed property -----
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        // I followed the lesson video
        // but this code below doesn't make sence for me...
        set {
            // newValue is a special keyword
            vacationAllocated = vacationTaken + newValue
        }
    }
}
var sara = Employee2(name: "Sara")
print(sara.vacationRemaining)
sara.vacationTaken = 3 // take 3-day vacation
print(sara.vacationRemaining)
sara.vacationRemaining = 4
print(sara.vacationAllocated)

// ----- didSet(=onChanged) -----
struct Game {
    var score = 10 {
        // onChanged() method
        // will be called when score got changed
        didSet {
            print("Score is now \(score)")
        }
    }
}
var game = Game()
game.score += 1
game.score -= 3
game.score += 5

// ----- property observer -----
struct App {
    var contacts = [String]() {
        // called before change
        // special value newValue is avaiable
        willSet {
            print("Current value: \(contacts)")
            print("New value will be \(newValue)")
        }
        // called after change
        // special value oldValue is avaiable
        didSet {
            print("There're now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
            print()
        }
    }
}
var app = App()
app.contacts.append("John")
app.contacts.append(contentsOf: ["Tom", "Sara", "Dan"])

// ----- create custom initializer -----
struct Player {
    let name: String
    let luckyNumber: Int
    
    // init() is a special method
    // starts without func keyword
    // when we declared custom initializer,
    // auto-generated initializer(by Swift) isn't available to avoid human error
    init(name: String) {
        self.name = name
        luckyNumber = Int.random(in: 1...6)
    }
}
let player = Player(name: "Bob")
print(player.luckyNumber)

