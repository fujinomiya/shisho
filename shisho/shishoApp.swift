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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "shisho")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?
            {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
