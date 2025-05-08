import UIKit

/* Class vs Struct */
struct Book {
    var title: String
    var author: String
}
var book1 = Book(title: "The Alchemist", author: "Paulo Coelho")
var book2 = Book(title: "To Kill a Mockingbird", author: "Harper Lee")
book1.title = "The great Gatsby"

print(book1)
print(book2)

struct Movie {
    var title: String
    var director : String
    var rating : Double
}

var movie1 = Movie(title: "Inception", director: "Christopher Nolan", rating: 8.8)
var movie2 = Movie(title: "The Shawshank Redemption", director: "Frank Darabont", rating: 9.3)
var movie3 = Movie(title: "The Godfather", director: "Francis Ford Coppola", rating: 9.2)

let movies = [movie1, movie2, movie3]

for movie in movies {
    print("Movie: \(movie.title), Director: \(movie.director), Rating: \(movie.rating)/10\n")
    
}
