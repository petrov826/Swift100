import Cocoa

// ----- protocol -----
// introducing new type!
// this is like a blueprint of struct or class
// similar to Interface in C#
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    // no function bodies here
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

// vehicle can be any type which conforms to Vehicle protocol
// Car, Bus, Train, or even Uber
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("It's too slow. Let's find other option")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

func getTrabelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTrabelEstimates(using: [car, bike], distance: 120)


// ----- opaque return types(some) -----
// a value type of Equatable can be compared with ==
// -> some Equatable means...
// "this function will return some kind of Equatable"
// and internally, Swift knows what the exact type is
func getRandomNumber() -> some Equatable {
    // we can use Int.random(in: 1...6) here
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

let num1 = getRandomNumber()
let num2 = getRandomNumber()
print(num1 == num2)


// ----- extension -----
var quote = "     I am the future, Flash... "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

// .trimmingCharacters() is nice, but loo long to type...
// so let's add extra function using extension
extension String {
    // as the name suggests, this func returns "trimmed" string
    func trimmed() -> String {
        // self = current string instance
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // override current value
    mutating func trim() {
        self = self.trimmed()
    }
    
    // convert String to [String]
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
print(quote.trimmed())

print("before: \(quote)")
quote.trim() // override values
print("after: \(quote)")

// another option is global function
// but using extesion instead is highly recommended
func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}
quote = "     I am the future, Flash... "
print(trim(quote))


let lyrics = """
I eat veges...
You eat beans...
"""
print(lyrics.lines)


// ----- fun trick of extension -----
struct Book {
    let title: String
    let pageCount: Int
    let readingHour: Int
    
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHour = pageCount / 50
    }
}
let book1 = Book(title: "BLEACH", pageCount: 200)

// we can't say Book(title: "BLEACH", pageCount: 200, readingHour: 5)
// because we declared custom init() "inside" Book struct
// this means if we declare it outside of struch, both of them are available

struct Book2 {
    let title: String
    let pageCount: Int
    let readingHour: Int
}

extension Book2 {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHour = pageCount / 50
    }
}
let book2 = Book2(title: "BLEACH", pageCount: 200, readingHour: 5) // auto-generated init()
let book3 = Book2(title: "BLEACH", pageCount: 300) // custom init()


// ----- protocol extension -----
// isNotEmpty seems super useful
// so why not adding it to Dict or Tuple?
// let's extend Collection instead of Array
// extension Array {
extension Collection {
    // new computed property
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

let guests = ["Mario", "Luigi", "Peach"]

// ! is not readable...
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

// much easier to read
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

let shoppingBag = ["Apple": 2, "Orange": 1, "Chocolate": 5]
if shoppingBag.isNotEmpty {
    print(shoppingBag)
}

// ----- advanced usage -----
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    // default function body of protocol
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    // minimum setup
    let name: String
}

let tom = Employee(name: "Tom")
tom.sayHello()

struct CEO: Person {
    let name: String
    
    // extra property
    let companyName: String
    // this struct already has default sayHello method
    // but of course, we can create custom one
    func sayHello() {
        print("Hello, I'm \(name) and CEO of \(companyName)")
    }
}
let tim = CEO(name: "Tim", companyName: "Apple")
tim.sayHello()

// ----- introducing allSatisty method -----
let numbersArray = [1, 2, 3]
let isAllEven1 = numbersArray.allSatisfy { $0.isMultiple(of: 2) }

//let numbersSet: Set = [1, 2, 3] // specify value type
let numbersSet = Set([1, 2, 3]) // much simpler than above
let isAllEven2 = numbersSet.allSatisfy { $0.isMultiple(of: 2) }

let numberDict = ["one": 1, "two": 2, "three": 3]
let isAllEven3 = numberDict.allSatisfy { $0.value.isMultiple(of: 2) }

print(isAllEven1, isAllEven2, isAllEven3)


// ----- checkpoint8 -----
protocol Building {
    var roomsCount: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    var category: String { get }
    func printSummary()
}

extension Building {
    func printSummary() {
        print("\(category) which has \(roomsCount) rooms, costs $\(cost)")
        print("For more info, please feel free to contact \(estateAgent)")
    }
}

struct House: Building {
    let roomsCount: Int
    let cost: Int
    let estateAgent: String
    let category = "House"
}

let myDreamHouse = House(roomsCount: 100, cost: 1_000_000, estateAgent: "Tom Housing")
myDreamHouse.printSummary()

struct Office: Building {
    let roomsCount: Int
    let cost: Int
    let estateAgent: String
    let category = "Office"
}

let smallOffice = Office(roomsCount: 2, cost: 2_000, estateAgent: "Bob Estate")
smallOffice.printSummary()
