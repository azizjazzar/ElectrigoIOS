

import SwiftUI

@main
struct ElectrigoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            VehiculeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
