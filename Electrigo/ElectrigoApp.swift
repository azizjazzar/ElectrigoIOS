//
//  ElectrigoApp.swift
//  Electrigo
//
//  Created by aziz jazzar on 4/11/2023.
//

import SwiftUI

@main
struct ElectrigoApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            BarDeNavigationView(selectedTab: 0)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
