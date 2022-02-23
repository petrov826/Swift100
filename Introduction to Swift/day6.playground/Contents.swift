import Cocoa

// ----- for loop -----
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for platform in platforms {
    print("swift works nice with \(platform)")
}

print(1...3, type(of: 1...3))
print(1..<3, type(of: 1..<3))

for i in 1...3 {
    print("5 * \(i) = \(5 * i)")
}

for _ in 1...3 {
    print("Hi!")
    // print(_) // we can't print underscore unlike python
}

// ----- while -----
// less useful than for loop
// one usage is handling random numbers
var roll = 0

while roll != 6 {
    roll = Int.random(in: 1...6)
    print("I rolled a \(roll)")
}

print("Now I have \(roll)")

// ----- break and continue in loop -----
let filenames = ["party.jpg", "homework.txt", "penguin.jpg"]

for filename in filenames {
    if !filename.hasSuffix(".jpg") { continue } // this is allowed
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples: [Int] = [Int]() // init an Int array

for i in 1...1_000_000 {
    // if i % 4 == 0 and i % 14 == 0
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 { break }
    }
}

print(multiples)

// ----- checkpoint 3 -----
for i in 1...100 {
    if i.isMultiple(of: 15) { print("FizzBuzz") }
    else if i.isMultiple(of: 3) { print("Fizz") }
    else if i.isMultiple(of: 5) { print("Buzz") }
    else { print(i) }
}
