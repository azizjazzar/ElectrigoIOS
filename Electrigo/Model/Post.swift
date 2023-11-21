import Foundation

struct Post: Identifiable, Codable {
    let _id: String?
    let description: String
    let category: String
    let upvotes: Int
    let downvotes: Int
    let date: String?  // Change to 'String?'

    var id: String? {
        return _id
    }

    init(_id: String?, description: String, category: String, upvotes: Int, downvotes: Int, date: String?) {
        self._id = _id
        self.description = description
        self.category = category
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.date = date
    }
}

