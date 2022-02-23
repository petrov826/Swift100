import Cocoa
import Foundation

// ----- fucntions -----
func sayHello() {
    print("Hello.")
    print("My name is petrov.")
    print("Glad to see you.")
}
sayHello()

func printMultiple(number1: Int, number2: Int) {
    print("\(number1) * \(number2) = \(number1 * number2)")
}

printMultiple(number1: 3, number2: 10)

// ----- return values from functions -----
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func sameLetters(string1: String, string2: String) -> Bool {
    // return string1.sorted() == string2.sorted() <- this works
    // surprisingly, swift allow us to omit return keyword
    // when it's a single line function
    string1.sorted() == string2.sorted()
}
print(sameLetters(string1: "abc", string2: "cba"))

func pythagoras(a: Double, b:Double) -> Double {
    // sqrt(pow(a, 2) + pow(b, 2)) <- this works
    sqrt(a * a + b * b) // more readable
}
print(pythagoras(a: 3, b: 4))
print(pythagoras(a: 5, b: 12))

// ----- return multiple values from functions -----
// [String: String] == string-string dict
func getUser() -> [String: String] {
    ["name": "Tom", "address": "London"]
}
let user = getUser()
// print(user["name"], user["address"]) // <- return values will be wrapped with Optional
print(user["name", default: "?"], user["address", default: "?"])

// return multiple values with tuple
func getUser2() -> (name: String, address: String) {
    (name: "Tom", address: "London")
    // ("Tom", "London") will work too
}
let user2 = getUser2()
print(user2.name, user2.address) // no need to unwrap

// return (string, string) tuple
func getUser3() -> (String, String) {
    ("Tom", "London")
}
let user3 = getUser3()
print(user3.0, user3.1) // access items with index

// we can do unpack like python
let (name, address) = getUser3()
print(name, address)

// ----- customize parameter label -----
// basic function example
func rollDice(sides: Int, count: Int) -> [Int] {
    // note: [Int] == type, [Int]() == empty int array
    var rolls = [Int]()
    for _ in 1...6 {
        rolls.append(Int.random(in: 1...sides))
    }
    return rolls
}
print(rollDice(sides: 6, count: 5))

// external parameter: _
// internal parameter: string
func isUppercased(_ string: String) -> Bool {
    string == string.uppercased()
}
print(isUppercased("HELLO"))
print(isUppercased("Hello"))

// advanced technique using extension
extension String {
    var isUppercased: Bool {
        self == self.uppercased()
    }
}
print("HELLO".isUppercased)
print("Hello".isUppercased)

// external parameter: to
// internal parameter: person
// this means we can use "for" as an external parameter not for keyword
// buyPresent(for: "You") <- much readable than buyPresent(person: "You")
func sendMail(to person: String) {
    print("Sent an email to \(person)")
}
sendMail(to: "Tom")
