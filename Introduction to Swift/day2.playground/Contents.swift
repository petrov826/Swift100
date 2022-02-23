import Cocoa

// ----- bool -----
print("test_file.txt".hasSuffix(".txt"))

print(12.isMultiple(of: 3))
print(10.isMultiple(of: 3))

var isFine = false
isFine = !isFine
print(isFine)

isFine.toggle()
print(isFine)

// ----- string -----
let name = "Tom"
print("My name is " + name) // string concat

print("My name is \(name)") // string interpolation

var age = 20
print("My name is \(name) and I'm \(age) years old.") // this works (without casting)
//print("My name is " + name  + " and I'm " + age + " years old.") // this doesn't work

print("5 x 5 is \(5 * 5)") // calculation inside string interpolation

// ----- checkpoint 1 -----
// making temperature converter
var temperatureC = 100.0
var temperatureF = (temperatureC * 9 / 5) + 32
print("temperature \(temperatureC)°C is equivalent to \(temperatureF)°F")

temperatureC = 20.0
temperatureF = (temperatureC * 9 / 5) + 32
print("temperature \(temperatureC)°C is equivalent to \(temperatureF)°F")
