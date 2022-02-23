import Cocoa

// ----- var and let -----
var age = 20
age = 21
print(age)

let name = "Tom"
print(name)

// ----- String -----
let message = "Hi all"
print(message.count) // 6 chars

print("you win!".uppercased())

print("Message: Hi Tom.".hasPrefix("Message"))
print("LondonMorning.jpg".hasSuffix(".jpg"))

// ----- Int -----
let number1 = 100
let million = 1_000_000
print(number1, million)

print(100.isMultiple(of: 3)) // 100 % 3 == 0? -> false
print(120.isMultiple(of: 3)) // 120 % 3 == 0? -> true

// ----- Double -----
print(0.1 + 0.2) // not exactly 0.3

let a = 1
let b = 2.0
let c = a + Int(b) // Swift is a type-safe language
// or let c = Double(a) + b
print(c)

var playerName = "Tom"
print(type(of: playerName))
// playerName = 30 // we can't do this. another example of type-safe
