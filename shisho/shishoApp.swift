//
//  shishoApp.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI
import CoreData

@main
struct shishoApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
