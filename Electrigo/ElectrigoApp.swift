//
//  ElectrigoApp.swift
//  Electrigo
//
//  Created by Aissa Dhia on 4/11/2023.
//

import SwiftUI

@main
struct ElectrigoApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var vm = locationlistViewModel()

    var body: some Scene {
        WindowGroup {
            //LocationlistView().environmentObject(vm)
            MapView()
        }
    }
}
