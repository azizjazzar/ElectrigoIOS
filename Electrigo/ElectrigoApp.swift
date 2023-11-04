//
//  ElectrigoApp.swift
//  Electrigo
//
//  Created by hamza farhani on 4/11/2023.
//

import SwiftUI

@main
struct ElectrigoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FlotteView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
