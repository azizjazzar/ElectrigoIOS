import Foundation
import CoreLocation

class UserViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    func validateUserInput() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty {
            return false
        }

        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            return false
        }

        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: password) {
            return false
        }

        return true
    }

    func createUser() {
        guard validateUserInput() else {
            return
        }
   

    }
}
