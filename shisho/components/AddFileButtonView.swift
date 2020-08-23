//
//  AddFileButtonView.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI

struct AddFileButtonView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dialog = NSOpenPanel()
    
    init()
    {
        dialog.title                   = "add new documents"
        dialog.allowsMultipleSelection = true
        dialog.allowedFileTypes        = ["pdf"]
    }
    
    var body: some View {
        Button(action: { openFileDialog() })
        {
            Label("Add Item", systemImage: "plus")
        }
    }
    
    func openFileDialog()
    {
        if(dialog.runModal() == NSApplication.ModalResponse.OK)
        {
            for filepath in dialog.urls
            {
                if let metadata = getMetadataPDF(url: filepath)
                {
                    let document = Document(context: viewContext)
                    
                    document.filepath     = filepath
                    document.title        = metadata.title ?? ""
                    document.author       = metadata.author ?? ""
                    document.release_date = metadata.release
                    document.pages        = metadata.pages
                    document.bookmark     = 0
                    document.favorite     = false
                  
                    save()
                }
            }
        }
    }
    
    func save()
    {
        do { try viewContext.save() }
        catch
        {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddFileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddFileButtonView()
    }
}
