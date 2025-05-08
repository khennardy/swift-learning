import UIKit

/* Mutating methods in Struct */

struct Book {
    var title: String
    mutating func updateTitle(newTitle: String){
        title = newTitle
    }
}
var myBook = Book(title: "The Alchemist")
myBook.updateTitle(newTitle: "The Great Gatsby")
print(myBook.title)

struct Movie {
    var rating: Double
    mutating func rateMovie(newRating: Double){
        rating = newRating
    }
}

var myMovie = Movie(rating: 4.5)
myMovie.rateMovie(newRating: 5.0)
print(myMovie.rating)
