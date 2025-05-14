import UIKit

// day 24: extending your own structs //

//step 1: extend a custom struct //

struct Book {
    var title: String
    var pages: Int
}

extension Book {
    func summary() -> String {
        return "\(title) has \(pages) pages."
    }
}

let novel = Book(title: "The Alchemist", pages: 222)
print(novel.summary())

struct Movie {
    var title: String
    var rating: Double
}
extension Movie {
    var isRecommended: Bool {
        return rating >= 8.0
        }
    
    func describe() -> String {
        return "\(title) has rating of \(rating)/10."
    }
}

let movie = Movie(title: "Titanic", rating: 7.0)
print(movie.describe())
print(movie.isRecommended ? "Recommended" : "Not Recommended")

