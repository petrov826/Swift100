import Cocoa

// ----- optionals -----
// this is safe because non-optional variable will have some value
// so, we don't have to check every value which might be nil
// using "if a != nil { }"
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

// 1. try to find the key "Mario" in opposites
// 2. if it's not nil, store it to marioOpposite
// 3. go inside if block.
//    important note: marioOpposite's type is String not String?
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var userName: String? = nil

// we don't know whether the box(optional variable) is empty or not
// so we have to "open" and check it
if let unwrappedName = userName {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional is empty")
}


// ----- nil is different from 0, "" and [] -----
var num1 = 1_000
var num2 = 0
var num3: Int? = nil
print(num2 == num3)
print(num1 * num2) // we can do this
// print(num1 * num3) // we can't do this because num3's type isn't Int

var str1 = "Hello"
var str2 = ""
var str3: String? = nil
print(str2.count)
// print(str3.count) // we can't do this because str3's type isn't String

var arr1 = [1, 2, 3]
var arr2: [Int] = []
var arr3: [Int]? = nil
print(arr2.count)
// print(arr3.count) // we can't do this because arr3's type isn't Array


// ----- if let -----
func square(_ number: Int) -> Int {
    // number' type is Int not Int?
    // no need to nil check here
    number * number
}

var userInputNumber: Int? = nil
// process user input here
if let unwrappedNumber = userInputNumber {
    print("square of \(unwrappedNumber) is \(square(unwrappedNumber))")
} else {
    print("User input is empty")
}

// "if let a = a { }"(using same variable name) is fine
// first "a" is only available inside if block
if let userInputNumber = userInputNumber {
    print("square of \(userInputNumber) is \(square(userInputNumber))")
} else {
    print("User input is empty")
}

// ----- what about in python? -----
// same function in python
// def square(number: int) -> int:
//     return number ** 2

// user_input_number = None
// process user input here

// Oneday, I was too tired and forgot to do None check
// (But in Swift, I can't forget it. Swift forces me to check)
// print(square(user_input_number))

// the result is TypeError below
// TypeError: unsupported operand type(s) for ** or pow(): 'NoneType' and 'int'


// ----- guard let -----
// "guard let" is similar to "if let"
// "if let" is focusing on "happy path" and don't care about "unhappy path"
// "guard let" is often used as "guard man" and do care about "unhappy path"
// if let a = a {
//     run if a is NOT nil
// }
// 
// guard let a = a else {
//     run if a is nil
//     return something
// }
func printSquare(_ number: Int?) {
    guard let number = number else {
        print("Missing value")
        return // inside guard block, we must return something or throw an error
    }
    // number is already unwrapped(available after guard block)
    // number's type is Int not Int?
    print("square of \(number) is \(number * number)")
}

var number1: Int? = 3
printSquare(number1)
number1 = nil
printSquare(number1) // Missing value


// ----- coalescing operator -----
let capital = [
    "Japan": "Tokyo",
    "UK": "London",
    "Australia": "Melbourne"
]
// note: reading dictionary key will always return optional
var capitalOfGermany = capital["Germany"] ?? "not found in dict"
capitalOfGermany = capital["Germany", default: "not found in dict"] // this works fine too
print(capitalOfGermany)


// ?? can be used with any other optional types
var tvShows = ["News10", "Sports23"]
var toWatch = tvShows.randomElement() // type of String? because array can be empty
print(toWatch ?? "No TV day")

tvShows = [String]() // No TV day
toWatch = tvShows.randomElement() // type of String? because array can be empty
print(toWatch ?? "No TV day")


struct Book {
    let title: String
    let author: String?
}
let newBook = Book(title: "My Journey", author: nil)
let author = newBook.author ?? "No author name"
print(author)


var input = ""
// type of Int(input) is Int?
var number = Int(input) ?? 0
print(number)

input = "a"
number = Int(input) ?? 0
print(number)


// ----- multiple optionals -----
var names = ["peter", "bob", "steve"]
// names.randomElement() is type of String?
// names.randomElement()?: try to unwrap it, then
// if successed -> process following code
//              -> "PETER" ?? "No one"  -> "PETER"
// else         -> ignore following code
//              -> nil ?? "No one"      -> "No one"
var chosen = names.randomElement()?.uppercased() ?? "No one"
print(chosen)

names = []
chosen = names.randomElement()?.uppercased() ?? "No one"
print(chosen)


var book2: Book? = nil
// if book2 is not nil, go forward
//     if author is not nil, go forward
//         if first is not nil, go forward
//         else nil
//     else nil
// else nil
var book2AuthorInitial = book2?.author?.first?.uppercased() ?? "A"
print(book2AuthorInitial)

book2 = Book(title: "My trip", author: "Tom")
book2AuthorInitial = book2?.author?.first?.uppercased() ?? "A"
print(book2AuthorInitial)


// ----- how to handle function failure with optionals -----
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

// try? only cares about successed or not
// if successed -> on inside if block
// if not       -> don't care what kind of error thrown
if let user = try? getUser(id: 23) {
    print(user)
}

// we can use this syntax too
// if error thrown, (try? getUser(id: 23)) will return nil
// so right hand side will be like below
// let user = nil ?? "No info"
let user = (try? getUser(id: 23)) ?? "No info"
print(user)


// ----- checkpoint9 -----
func getRandom(from array: [Int]?) -> Int {
    array?.randomElement() ?? (1...100).randomElement()!
}

print(getRandom(from: [1,2,3]))
print(getRandom(from: [Int]()))
print(getRandom(from: nil))
