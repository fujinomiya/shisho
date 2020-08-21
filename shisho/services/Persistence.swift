//
//  Persistence.swift
//  shisho
//
//  Created by fujinomiya on 21.8.2020.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false)
    {
        container = NSPersistentContainer(name: "shisho")
        
        if inMemory
        {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?
            {
                //TODO: error handling
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
}

