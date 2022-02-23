import Cocoa

// ----- type annotation -----
var age: Int = 22
var score: Double = 22
print(age, score)

// type annotation is useful when we need a constant having specific type
// similar to the "final" keyword of other language
let playerName: String
// complex logic here
playerName = "Tom"
// more complex logic here
print(playerName)

// ----- checkpoint 2 -----
let watchedMovies = [
    "Matrix",
    "Police Story",
    "Inception",
    "STAR TREK",
    "Matrix"
]
let movieCount = watchedMovies.count
let uniqueMovieCount = Set(watchedMovies).count
print("I watched \(movieCount) movies. There're \(uniqueMovieCount) unique movies")
