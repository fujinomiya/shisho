//
//  CoreData.swift
//  shisho
//
//  Created by fujinomiya on 20.8.2020.
//

import Foundation
import SwiftUI
import CoreData

struct CoreData {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func save()
    {
        do { try managedObjectContext.save() }
        catch
        {
            print(error.localizedDescription)
            //TODO: handle failures
        }
    }
    
    func addDocument(file: URL, title: String, author: String, release: Date?, pages: Int32, bookmark: Int32, favorite: Bool)
    {
        let document = Document(context: managedObjectContext)
        
        document.file     = file
        document.title    = title
        document.author   = author
        document.date     = release
        document.pages    = pages
        document.bookmark = bookmark
        document.favorite = favorite
        
        save()
    }
    
}
