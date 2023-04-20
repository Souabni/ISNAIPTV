//
//  ISNAIPTVApp.swift
//  ISNAIPTV
//
//  Created by Dev on 20/04/2023.
//

import SwiftUI

@main
struct ISNAIPTVApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
