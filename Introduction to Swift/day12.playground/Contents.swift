import Cocoa

// ----- class -----
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game()
newGame.score += 10

// ----- inheritance -----
class Employee {
    let hours: Int
    
    // we have to write init()
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

// this class can't have child class
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours")
    }
    
    override func printSummary() {
        print("I work \(hours) hours a day, but sometime I play with my cat")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to a meeting for \(hours) hours")
    }
}

let tom = Developer(hours: 5)
let sara = Manager(hours: 3)
tom.work()
sara.work()

let john = Developer(hours: 6)
john.printSummary()


// ----- initializer for classes -----
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

var tesla = Car(isElectric: true, isConvertible: false)
print(tesla.isElectric, tesla.isConvertible)


// if there's no need for custom init(), just omit it
class Car2: Vehicle {
    let isConvertible = false
}

// Car2(isElectric: true) is equal to Vehicle(isElectric: true)
var tesla2 = Car2(isElectric: true)
print(tesla2.isElectric, tesla2.isConvertible)


// ----- how to copy classes -----
class User {
    var name = "_"
    
    func copy() -> User {
        let user = User()
        user.name = name
        return user
    }
}

var user1 = User()
var user2 = user1
var user3 = user1.copy()
user1.name = "Tom"
// user1 and user2 share their data, but user3 doesn't
print(user1.name)
print(user2.name)
print(user3.name)

// both have the same memory address
// https://stackoverflow.com/questions/24058906/printing-a-variable-memory-address-in-swift
print(Unmanaged.passUnretained(user1).toOpaque())
print(Unmanaged.passUnretained(user2).toOpaque())
// but user3 doesn't
print(Unmanaged.passUnretained(user3).toOpaque())


// ----- deinitializer for classes -----
class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): Hello everyone!")
    }
    
    // no parentheses
    deinit {
        print("User \(id): See you")
    }
    
    func greet() {
        print("User \(id): What's a nice day!")
    }
}

// output will be...
// User 1: Hello everyone!
// User 1: What's a nice day!
// User 1: See you
for i in 1...2 {
    let user = User2(id: i)
    user.greet()
}
print("----------")

// output will be
// User 1: Hello everyone!
// User 1: What's a nice day!
// ...
// Loop is finished!
// User 1: See you
var users = [User2]()
for i in 1...2 {
    let user = User2(id: i)
    user.greet()
    users.append(user)
}
print("Loop is finished!")
users.removeAll()
print("Array is empty now.")

// ----- how to work with variables inside classes
class User3 {
    var name = "Paul"
}

let user = User3()
// we can change variables inside classes even if it's constant
// because user is essentially a pointer and
// user.name = "Tom" doesn't change the pointer itself
user.name = "Tom"
print(user.name)

var user4 = User3()
user4.name = "Bob"
print(user4.name)
user4 = User3() // now, user4 is pointing to new instance of User4
print(user4.name)

// to recap
// class, properties,   behaviour
// let  , let       ->  can't change pointer and              its properties
// let  , var       ->  can't change pointer but can change   its properties
// var  , let       ->  can   change pointer but can't change its properties
// var  , var       ->  can   change pointer and              its properties


// ----- checkpoint 7 -----
class Animal {
    let nLegs: Int
    
    init(nLegs: Int) {
        self.nLegs = nLegs
    }
}

class Dog: Animal {
    func speak() { print("I'm a dog") }
}

class Corgi: Dog {
    override func speak() {
        print("I'm a corgi!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("I'm a poodle!")
    }
}

class Cat: Animal {
    func speak() { print("I'm a cat") }
}

class Persian: Cat {
    let isTame: Bool
    
    init(nLegs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(nLegs: nLegs)
    }
    
    override func speak() { print("I'm a\(isTame ? " pet " : " wild ")persian!") }
}

class Lion: Cat {
    let isTame: Bool
    
    init(nLegs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(nLegs: nLegs)
    }
    
    override func speak() { print("I'm a\(isTame ? " pet " : " wild ")lion!") }
}

let corgi = Corgi(nLegs: 4)
corgi.speak()

let poodle = Poodle(nLegs: 4)
poodle.speak()

let petPersian = Persian(nLegs: 4, isTame: true)
petPersian.speak()

let wildPersian = Persian(nLegs: 4, isTame: false)
wildPersian.speak()

let petLion = Lion(nLegs: 4, isTame: true)
petLion.speak()

let wildLion = Lion(nLegs: 4, isTame: false)
wildLion.speak()
