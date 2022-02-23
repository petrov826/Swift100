import Cocoa

// ----- Array -----
var bandMembers = ["Tom", "John", "Paul", "Sam"]
var numbers = [10, 20, 35]
var temperatures = [11.8, 20.9, 28.1]

bandMembers.append("Bob")
print(bandMembers)

print(type(of: bandMembers))
//bandMembers.append(32) // can't append int to string array

// init an array of Int. we can use Array<Int>() instead.
// more generally we can init an array of type T with [T]() or Array<T>()
var scores = [Int]()
scores.append(20)
scores.append(22)
scores.append(25)
print(scores)
print(scores.count) // print how many items in this array

scores.remove(at: 1) // remove 2nd item
print(scores, scores.count)

scores.removeAll() // remove all items(as the name suggests)
print(scores, scores.count)

let presidents = ["Bush", "Obama", "Trunp", "Biden"]
print(presidents.contains("Bill Gates"))

print(presidents.sorted())
print(presidents.reversed())

// ----- Dictionary -----
var employee = [
    "name": "Tom",
    "location": "London",
    "position": "vice-president"
]
print(employee["name"]) // this gives Optional("Tom") not simple "Tom"
print(employee["name"]!) // force unwrapping
print(employee["name", default: "Unknown"]) // much safer than force unnwrapping
print(employee["age", default: "Unknown"]) // this works fine
//print(employee["age"]!) // this gives an error

print(employee)
employee["position"] = "president" // overwrite the value
print(employee)

print(employee.count) // .count is available


let olympics = [
    2012: "London",
    2016: "Lio de Janeiro",
    2021: "Tokyo",
    2024: "Paris"
]
print(olympics[2012, default: "no olymics game held this year"])
print(olympics[2015, default: "no olymics game held this year"])

var hasGraduated = [String: Bool]() // init a String-Bool dictionary

// ----- Set -----
// create a set from an array
var watchedMovies = Set([
    "Matrix",
    "Police Story",
    "Inception"
])

print(watchedMovies)
watchedMovies.insert("STAR TREK") // add item with .insert() not .append()
print(watchedMovies)
watchedMovies.insert("Matrix") // inserting already watched movie
print(watchedMovies)

var visitedPlace = Set<String>() // init a set of string

// ----- Enum -----
// declare an enum
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
// or shorter way
//enum Weekday {
//    case monday, tuesday, wednesday, thursday, friday
//}

var day = Weekday.monday
print(day, type(of: day))
day = .tuesday
//day = .sunday // no such member
