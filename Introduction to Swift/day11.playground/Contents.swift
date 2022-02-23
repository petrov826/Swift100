import Cocoa

// ----- access control -----
struct BankAccount {
    // access control family
    // private:         accessable only inside of this struch
    // fileprivate:     accessable only inside of this file
    // public:          accessable from anywhere
    // private(set):    can't set, but can get
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if amount < funds {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 1000)

let withdrawSucceeded = account.withdraw(amount: 2000)

if withdrawSucceeded {
    print("withdraw money successfully")
} else {
    print("Failed to get money")
}
print(account.funds)


// ----- static properties and methods -----
struct School {
    // static properties and methods
    // attach to struct itself(not instance)
    static var studentCount = 0
    
    // inside static method,
    // we can change static properties without mutating keyword
    static func add(studentName: String) {
        print("\(studentName) joined the school!")
        studentCount += 1
    }
}
School.add(studentName: "Harry Potter")
print(School.studentCount)


// ----- usage of static -----
// settings in one place
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "setting.json"
    static let homeURL = "www.hackingwithswift.com"
}
print(AppData.version)

// struct Employee should have single example
struct Employee {
    let name: String
    let password: String
    
    static let example = Employee(name: "Tom", password: "1234ABcd")
}
print(Employee.example)


// ----- checkpoint 6 -----
struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 0
    
    // if currentGear is marked as private,
    // we have to create custom init().
    // but it's marked as private(set), we don't need it
    // init(model: String, numberOfSeats: Int) {
    //     self.model = model
    //     self.numberOfSeats = numberOfSeats
    // }
    
    mutating func changeGear(_ newValue: Int) -> Bool {
        if (1...10).contains(newValue) {
            currentGear = newValue
            return true
        } else {
            return false
        }
    }
}
var superCar = Car(model: "Super Car 2022", numberOfSeats: 2)
var changeSucceeded = superCar.changeGear(10)
print(superCar.currentGear)
