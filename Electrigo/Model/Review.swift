import Foundation

struct Review: Identifiable, Codable {
    
    let _id: String?
    let borne : String?
    let rating: Int
    let comment: String

    var id: String? {
        return _id
    }

    init(id: String? = nil, rating: Int, comment: String , borne:String?) {
        self._id = id
        self.rating = rating
        self.comment = comment
        self.borne = borne
    }
}
