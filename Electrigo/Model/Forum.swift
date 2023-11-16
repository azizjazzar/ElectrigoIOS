import Foundation





struct Userr {
    var userrname: String
    var userrImageName: String
}

class Comment: Identifiable, ObservableObject {
    var id = UUID()
    @Published var text: String
    @Published var replies: [Comment] = []

    init(text: String) {
        self.text = text
    }
}

struct Post {
    var userr: Userr
    var description: String
    var date: String
    var category: String
    var comments: [Comment]
    // ...
}
