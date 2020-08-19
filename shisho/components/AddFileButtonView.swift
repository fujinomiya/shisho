//
//  AddFileButtonView.swift
//  shisho
//
//  Created by fujinomiya on 19.8.2020.
//

import SwiftUI

struct AddFileButtonView: View {
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
            Image(systemName: "plus")
        }
    }
    
    func openFileDialog()
    {
        if(dialog.runModal() == NSApplication.ModalResponse.OK)
        {
            for filepath in dialog.urls
            {
                getMetadataPDF(url: filepath)
                //TODO: add returned objects to database
            }
        }
    }
}

struct AddFileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddFileButtonView()
    }
}