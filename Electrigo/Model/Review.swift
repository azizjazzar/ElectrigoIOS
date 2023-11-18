import Foundation

struct Review:  Hashable, Codable {
    let rating: Int
    let comment: String

    init( rating: Int, comment: String) {
        self.rating = rating
        self.comment = comment
    }
}
