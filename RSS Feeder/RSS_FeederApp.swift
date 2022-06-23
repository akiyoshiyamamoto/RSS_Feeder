//
//  RSS_FeederApp.swift
//  RSS Feeder
//
//  Created by YAMAMOTOAKIYOSHI on 2022/06/23.
//

import SwiftUI

@main
struct RSS_FeederApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
