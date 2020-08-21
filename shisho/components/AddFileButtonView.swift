//
//  AddFileButtonView.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI

struct AddFileButtonView: View {
    let coredata = CoreData()
    let dialog   = NSOpenPanel()
    
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
                    coredata.addDocument(file:     filepath,
                                         title:    metadata.title ?? "",
                                         author:   metadata.author ?? "",
                                         release:  metadata.release,
                                         pages:    metadata.pages,
                                         bookmark: -1,
                                         favorite: false)
                }
            }
        }
    }
}

struct AddFileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddFileButtonView()
    }
}
