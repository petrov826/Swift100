import Cocoa

// ----- provide default values for parameter
func printTimeTable(for number: Int, end: Int = 5) {
    for i in 1...end {
        print("\(i) * \(number) = \(i * number)")
    }
}

printTimeTable(for: 5, end: 3)
print()
printTimeTable(for: 3)

var names = ["Tom", "Bob", "Sara"]
print(names.count)
// default value of keepingCapacity = false(for most cases),
// but we can pass true to keep capacity
names.removeAll(keepingCapacity: true)
print(names.count)

// ----- error handling in functions -----
enum PasswordError: Error { case short, obvious }

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 { return "Good" }
    else if password.count < 10 { return "Great" }
    else { return "Excellent" }
}

var password = "12345"

do {
    // try something ricky
    let result = try checkPassword(password)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use longer password")
} catch PasswordError.obvious {
    print("This password is too obvious")
} catch {
    print("There's an error: \(error.localizedDescription)")
}

password = "hello everyone!"
// use try! only if you’re 100% sure
let result = try! checkPassword(password)
print("Password rating: \(result)")

// ----- checkpoint 4 -----
enum FuncError: Error { case outOfBounds, noRoot }
func get_sqrt(_ x: Int) throws -> Int {
    if (1...100).contains(x) {
        for i in 1...100 {
            if i*i == x {
                return i
            }
        }
    } else {
        throw FuncError.outOfBounds
    }
    throw FuncError.noRoot
}

let x: Int = 16
do {
    let sqrt = try get_sqrt(x)
    print("sqrt of \(x) is \(sqrt)")
} catch FuncError.noRoot {
    print("no root for \(x)")
} catch FuncError.outOfBounds {
    print("x must be in 1...10000")
}
