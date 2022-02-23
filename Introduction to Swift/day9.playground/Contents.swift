import Cocoa

// ----- create and use closure -----
func greetUser() {
    print("Hi there")
}
greetUser()
// instead of calling function, we can assign function itself to variable
// slimilar to python
var greetCopy = greetUser
greetCopy()


// without creating function
// slimilar to python's lambda
let sayHello = {
    print("Hello!")
}
sayHello()

// (name: String)   : parameter's name and type
//                    if no parameter, use ()
// -> String        : return type
//                    if no parameter, use Void
// in               : this marks end of parameter & types
//                               and start of the closure
let sayHello2 = { (name: String) -> String in
    // omit return keyword
    "Hi \(name)"
}
print(sayHello2("Tom"))

// ----- type annotation of closure -----
var greetCopy2: () -> Void = greetUser
greetCopy2()


func getUserData(for id: Int) -> String {
    if id == 2000 {
        return "Tom"
    } else {
        return "no user found"
    }
}

// variable "data" doesn't have any information
// for func name and parameter names
let data: (Int) -> String = getUserData
// so, we can't say data(for: 2000) because parameter names are gone
let user = data(2000)
print(user)

// ----- passing func or closesure to func -----
let team = ["Tom", "Bob", "Risa", "Sara", "Tiger"]
// we can pass sorting func to .sorted()
let sortedTeam = team.sorted()
print(sortedTeam)

// sort alphabetically
// "Bob" < "Risa" == true  -> the 1st name of "Bob" comes first
// "Risa" < "Bob" == false -> the 2nd name of "Bob" comes first
func defaultSorted(name1: String, name2: String) -> Bool {
    name1 < name2
}

// captaion Tom comes first
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Tom" {
        return true  // true  -> the 1st name of "Tom" comes first
    } else if name2 == "Tom" {
        return false // false -> the 2nd name of "Tom" comes first
    } else {
        return name1 < name2 // sort alphabetically
    }
}

// passing func to func
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// passing closure to func
// this syntax is called inline closure
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Tom" {
        return true  // true  -> the 1st name of "Tom" comes first
    } else if name2 == "Tom" {
        return false // false -> the 2nd name of "Tom" comes first
    } else {
        return name1 < name2 // sort alphabetically
    }
})
print(captainFirstTeam2)

// ----- shorthand syntax -----
// .sorted() only accept func or closure
// that takes 2 string and returns 1 bool
// before: (name1: String, name2: String) -> Bool in
// after : name1, name2 in

// we can also omit (by: ~ ) too
// this is called trailing closure syntax
let captainFirstTeam3 = team.sorted { name1, name2 in
    if name1 == "Tom" {
        return true  // true  -> the 1st name of "Tom" comes first
    } else if name2 == "Tom" {
        return false // false -> the 2nd name of "Tom" comes first
    } else {
        return name1 < name2 // sort alphabetically
    }
}
print(captainFirstTeam3)


// instead of naming parametes, we can use auto-generated parameters
// we can access them with $0, $1, ...
let captainFirstTeam4 = team.sorted {
    if $0 == "Tom" {
        return true  // true  -> the 1st name of "Tom" comes first
    } else if $1 == "Tom" {
        return false // false -> the 2nd name of "Tom" comes first
    } else {
        return $0 < $1 // sort alphabetically
    }
}
print(captainFirstTeam4)


// reverse sort
let reversedTeam = team.sorted { $0 > $1 }
print(reversedTeam)


// ----- showcase of closure -----
// filter each item of array with closure
// no need for looping
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// transform each item of array with closure
let uppercasedTeam = team.map { $0.uppercased() }
print(uppercasedTeam)


// ----- accept functions as parameters(like sorted(), or filter()) -----
// note that using is not keyword but external parameter name
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let number = generator()
        numbers.append(number)
    }
    return numbers
}

let rolls = makeArray(size: 3) {
    Int.random(in: 1...6)
}
print(rolls)

// we can't do like this because of type mismatch
// Int.random(in: 1...6) will return some int.
// but makeArray excepts to be passed func or closure
//let rolls2 = makeArray(size: 2, using: Int.random(in: 1...6))
//print(rolls2)

// using multiple closure
func do2Tasks(first: () -> Void, second: () -> Void) {
    print("preparing 1st task...")
    first()
    print("preparing 2nd task...")
    second()
    print("done")
}
do2Tasks {
    print("generating random numeber...")
    print("random number: \(Int.random(in: 1...3))")
} second: {
    print("sending an e-mail to Tom...")
}


// ----- checkpoint 5 -----
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// 1. Filter out(=remove) any numbers that are even
// 2. Sort the array in ascending order
// 3. Map them to strings in the format “7 is a lucky number”
// 4. Print the resulting array, one item per line
let toPrint = luckyNumbers.filter {
    !$0.isMultiple(of: 2)
}.sorted().map {
    "\($0) is a lucky number"
}

for p in toPrint {
    print(p)
}
